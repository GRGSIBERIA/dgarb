#-*- encoding: utf-8
require "./agent"

module DW

  class Post < Agent
    def initialize()
      super
      @api_type = "post.json"
    end

    def Get()
      @agent.get(@url + @api_type)
    end

  end

end