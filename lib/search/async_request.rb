# To change this template, choose Tools | Templates
# and open the template in the editor.

class AsyncRequest
 
  def self.execute

    # t = Thread.new{
    for s_engine in SearchServer.all
      puts s_engine.server
      #if const_defined?(s_engine.server.to_sym)
      kclass = Object.const_get(s_engine.server) rescue nil
      if kclass

        p kclass
        options={}
        options[:url]=s_engine.base_url
       # options[:url]="www.google.co.in" #?v=1.0&q=Earth%20Day&start=0&num=100
        options[:page_limit]=s_engine.records_per_page
        
        for word in Keyword.find(:all,:conditions=>"last_search is NULL")
          result=nil
          begin
          result = kclass.search(word,options)
          rescue=>e
            p e
          end
          unless result
            Rails.logger.info "Search is not found"
          end
        end
      end
      #end

    end
    #}
    #t.join
  end

end
