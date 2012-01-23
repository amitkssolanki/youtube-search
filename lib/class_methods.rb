module ClassMethods

  # = Search method for youtube data api
  # 
  # @results = YoutubeSearch.search("concert")
  # @results = YoutubeSearch.search("concert", :maxresults => 10)
  # @results =  YoutubeSearch.search("concert", :order => 'rating')
  # The options for this method can be checked out at http://code.google.com/apis/youtube/2.0/reference.html
  # Enhancement to the following methods are welcomed

  def search(str = '', args={})
    args[:maxresults] ||= 3
    args[:order] ||= 'relevance'
    uri = URI.parse("http://" + YOUTUBE_SITE + "/feeds/api/videos?q=#{str}&max-results=#{args[:maxresults]}&alt=json&orderby=#{args[:order]}&v=2")
    resp = Net::HTTP.get_response(uri)

    parse_response(resp)
  end  
end