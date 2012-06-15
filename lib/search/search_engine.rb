
class SearchEngine
  @results=[]

  def self.log_results(keyword_id,search_engine)

     server = SearchSever.find_by_server(search_engine)
     if    server
       for result in @results
          result[:keyword_id]=  keyword_id
          result[:search_server_id] = server.id
          Response.create(result)
       end
      
     end

  end

end
