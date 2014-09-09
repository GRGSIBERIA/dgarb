#-*- encoding: utf-8

require "./request/agent.rb"

module DGrab
  class RelatedTag < Agent
    def initialize()
      super
    end

    def listing(params={})
      uri = @url + "related_tag.json?"
      uri += addParams(params, :query)
      uri += addParams(params, :category)
      getJSON(uri)
    end

    DGrab.listing(self)

  end

end