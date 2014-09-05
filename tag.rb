#-*- encoding: utf-8

require "./agent.rb"

module DW
  class Tag < Agent
    def initialize()
      super
    end

    def listing(params={})
      uri = @url + "tags.json?"
      uri += addParam(params, :limit)
      uri += addParam(params, :page)

      getJSON(uri)
    end
  end
end