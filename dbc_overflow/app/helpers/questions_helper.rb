require 'httparty'

module QuestionsHelper
end

module API
  class Client
    include HTTParty
    base_uri = "http://api.github.com"
    headers["User-Agent"] = "franjohn21"

    def zen
      response = self.class.get('/zen')
      return response
    end

  end
end
