# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'lib/search/search_engine'
class Bing < SearchEngine
  
  
  def self.search(keyword,options)
    start=0
    options[:method]="GET"
    while start < options[:page_limit]*2
      options[:query_string]="/search?q=#{keyword}&start=#{start}&num=#{options[:page_limit]}"
      results = APIConnector.connect(options[:url],options)
      p results
      parse(results)
      start +=options[:page_limit]
    end
    log_result
  end


  private
  def parse()

  end

end
