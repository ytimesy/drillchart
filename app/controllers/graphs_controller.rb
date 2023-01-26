require 'csv'

class GraphsController < ApplicationController

  def index
    read_csv
    caliculate_total_score
  end
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