# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'net/http'
require 'timeout'
require 'uri'
class APIConnector

  def self.connect(url, options)
    result=""
    if options[:method]=="GET"
      p url
      req = Net::HTTP::Get.new(options[:query_string])
      req.add_field("content-type", "text/html")

      Timeout::timeout(30) do
        
        if options[:ssl]
          http_req = Net::HTTP.new(url, 443)
          http_req.use_ssl=true
        else
          http_req = Net::HTTP.new(url, 80)
          
        end
        resp = http_req.start do |http|
          http.request(req)
        end
        result=resp.body
      end
    end
    result
  end


end
