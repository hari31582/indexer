#Google API
  require 'nokogiri'
  require 'lib/search/search_engine'
  class Google < SearchEngine
    
    
    def self.search(keyword,options)
      start=0
      options[:ssl]=true
      options[:method]="GET"
      while start < options[:page_limit]*2
      options[:query_string]="/search?q=#{keyword.keyword}&start=#{start}&num=#{options[:page_limit]}"
      results = APIConnector.connect(options[:url] ,options)

      p "Results"
      p results

      parse(results)
      start +=options[:page_limit]
      end
      log_result
    end

   private
   def self.parse(results)

   end
  
  
  end

