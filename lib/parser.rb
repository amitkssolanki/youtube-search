module Parser

  # = Parser for youtube data api
  # 
  # @results = YoutubeSearch.search("concert")
  # @results[:links] => gives you links of searched string on youtube
  # @results[:message] => gives you "Success" string on successful search
  # @results[:error] => gives you reason for search being failed
  def parse_response(response)
    data = ((response.body) ? JSON.parse(response.body) : {})
    links = data["feed"]["entry"].collect{|entry| entry["link"].first["href"]}
    if response.code.to_i == 200      
      return {:links => links}.merge!(:message => "Success") unless data.is_a?(Array)
    else
      {:links => links}.merge!(:message => "#{response.code} #{response.message}")
    end
    links
  rescue Exception => e
    return :error => "Invalid Request: #{e.message}"
  end

end