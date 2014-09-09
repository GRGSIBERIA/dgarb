#-*- encoding: utf-8

require "./danbooru/agent.rb"

module DGrab
  module Agent
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
    end
  end
end