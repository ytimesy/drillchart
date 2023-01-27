require 'csv'
require 'open-uri'
require 'webdrivers'

class GraphsController < ApplicationController

  def index
    read_csv
    caliculate_total_score
  end

  def create
    read_csv
    deta_scrape
    output_csv
  end


  private

  def read_csv
    @ids_array = []
    @titles = []
    @categorys = []
    @hrefvalues = []
    @scores = []
    @max_scores = []
    CSV.foreach("./drill.csv", headers: true) do |row|
      @ids_array << row['id'].to_i
      @titles << row['title']
      @categorys << row['category'].to_i
      @hrefvalues << row['hrefvalue']
      @scores << row['score'].to_i
      @max_scores << row['max_score'].to_i
    end
  end

  def caliculate_total_score
    @totalScores = [ 0, 0, 0, 0, 0 ]
    @totalMaxScores = [ 0, 0, 0, 0, 0 ]
    @categorys.each_with_index do |category, i|
      @totalScores[category - 1] += @scores[i]
      @totalMaxScores[category - 1] += @max_scores[i]
    end
  end

  def deta_scrape
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--headless")
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.navigate.to "https://master.tech-camp.in/me#expert-exam"
    sleep(1)
    email_field = driver.find_element(:id, 'email_input')
    email_field.send_keys(ENV["TECH_ADDRESS"])
    sleep(1)
    password_field = driver.find_element(:id, 'password_input')
    password_field.send_keys(ENV["TECH_PASSWORD"])
    sleep(1)
    login_button = driver.find_element(:id, 'signin_button')
    login_button.click
    sleep(1)
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { driver.find_element(:css, 'a[href="#expert-exam"]').displayed? }
    link = driver.find_element(:css, 'a[href="#expert-exam"]')
    link.click
    sleep(1)
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { driver.execute_script("return document.readyState") == "complete" }
    sleep(1)
    titles = driver.find_elements(:css, ".expert-exam_link")
    sleep(1)
    atags = driver.find_elements(:tag_name, 'a')
    href_values = atags.map { |a| a.attribute("href") }
    new_href_values = href_values.grep(/expert_exam_responses/)

    
    new_href_values.each_with_index do |href_value, i|
      #サイトから取り出したurlを問題集のURLに改変
      str_splited = href_value.split("/")
      if str_splited.last == "edit"
        str_splited.pop
      end
      str_splited.pop
      str_splited.push("new")
      raw_href = str_splited.join("/")
      if titles[i] != nil
        string_array = titles[i].text.split("\n")
      else
        break
      end
      score_str = string_array[1].match(/\d+/).to_s
      unless @hrefvalues.include?(raw_href)
        #新しいURLなら追加
        @ids_array << (@hrefvalues.length + 1)
        @categorys << 1
        @scores << score_str.to_i
        @max_scores << 10
        @titles << string_array[0].to_s
        @hrefvalues << raw_href
      else
        #@hrefvaluesにURLを持っている場合上書き
        num = @hrefvalues.index(raw_href)
        @ids_array[num] = num + 1
        if score_str.to_i 
          @scores[num] = score_str.to_i
        end
        @titles[num] = string_array[0].to_s
        @hrefvalues[num] = raw_href
      end
    end

    driver.quit
    
  end

  def output_csv
    CSV.open("./drill.csv", "w") do |csv|
      header = %w(id category score max_score title hrefvalue )
      csv << header
      @categorys.each_with_index do |category, i|
        values = [ @ids_array[i], category, @scores[i], @max_scores[i], @titles[i], @hrefvalues[i] ]
        csv << values
      end
    end
  end

end