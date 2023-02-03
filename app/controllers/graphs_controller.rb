require 'csv'
require 'open-uri'
require 'webdrivers'
require '/opt/render/project/src/chromedriver'

class GraphsController < ApplicationController

  def index
    destroy
  end

  def create
    @category = 0
    read_init_csv
    deta_scrape
    output_csv
    caliculate_total_score
    make_chart_data
    render :show
  end

  def show
    @category = params[:id]
    read_csv
    caliculate_total_score
    make_chart_data
  end

  def destroy
    File.delete("#{Rails.root}/drill.csv") rescue nil
    render :index
  end

  private

  def make_chart_data
    @chartUrl = [[], [], [], [], [], []]
    @chartScores = [[], [], [], [], [], []]
    @chartTitles = [[ "学習ガイド/基礎試験", "基礎コース", "応用コース", "ドリル基礎", "ドリル応用"], [], [], [], [], []]
    @titles.each_with_index do |title, i|
      @chartUrl[@categorys[i]] << @hrefvalues[i]
      @chartScores[@categorys[i]] << @scores[i]
      @chartTitles[@categorys[i]] << @titles[i]
    end
  end

  def read_init_csv
    @ids_array = []
    @categorys = []
    @scores = []
    @max_scores = []
    @titles = []
    @hrefvalues = []
    CSV.foreach("./drill_init.csv", headers: true) do |row|
      @ids_array << row['id'].to_i
      @categorys << row['category'].to_i
      @scores << row['score'].to_i
      @max_scores << row['max_score'].to_i
      @titles << row['title']
      @hrefvalues << row['hrefvalue']
    end
  end

  def read_csv
    @ids_array = []
    @categorys = []
    @scores = []
    @max_scores = []
    @titles = []
    @hrefvalues = []
    begin
      CSV.foreach("./drill.csv", headers: true) do |row|
        @ids_array << row['id'].to_i
        @categorys << row['category'].to_i
        @scores << row['score'].to_i
        @max_scores << row['max_score'].to_i
        @titles << row['title']
        @hrefvalues << row['hrefvalue']
      end
    rescue Errno::ENOENT => e
      read_init_csv
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
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.navigate.to "https://master.tech-camp.in/me#expert-exam"
    wait = Selenium::WebDriver::Wait.new(timeout: 1000) # seconds
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

    ids = 0
    new_href_values.each_with_index do |new_href_value, i|
      #サイトから取り出したurlを問題集のURLに改変
      str_splited = new_href_value.split("/")
      if str_splited.last != "edit"
        str_splited.pop
        str_splited.push("new")
        raw_href = str_splited.join("/")
        string_array = titles[ids].text.split("\n")
        score_str = string_array[1].match(/\d+/).to_s
        
        @ids_array[ids] = ids + 1
        @scores[ids] = score_str.to_i
        @titles[ids] = string_array[0].to_s
        @hrefvalues[ids] = raw_href
        num = @hrefvalues.index(raw_href)
        if num != nil 
          if @categorys[num] != nil
            @categorys[ids] = @categorys[num]
          else
            @categorys[ids] = 5
          end
          if @max_scores[num] != nil
            @max_scores[ids] = @max_scores[num]
          else
            @max_scores[ids] = 10
          end
        else
          if @scores[ids] > 10
            @categorys[ids] = 1
            @max_scores[ids] = 100   
          else
            @categorys[ids] = 5
            @max_scores[ids] = 10   
          end
        end
        ids += 1
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

  def make_init_csv_for_kanri
    CSV.open("./drill_init.csv", "w") do |csv|
      header = %w(id category score max_score title hrefvalue )
      csv << header
      @categorys.each_with_index do |category, i|
        values = [ @ids_array[i], category, 0, @max_scores[i], @titles[i], @hrefvalues[i] ]
        csv << values
      end
    end
  end

end