# Another gem to search videos on youtube using their data api
require 'json'
require 'net/http'
require 'parser'
require 'class_methods'

YOUTUBE_SITE = "gdata.youtube.com"

class YoutubeSearch
  extend Parser
  extend ClassMethods
end

