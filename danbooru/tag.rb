#-*- encoding: utf-8

require "./danbooru/agent.rb"

module DGrab
  class Tag < Agent
    def initialize()
      super
    end

    def listing(params={})
      uri = @url + "tags.json?"
      uri += addParam(params, :limit)
      uri += addParam(params, :page)
      uri += addParam(params, :search_name_matches)
      uri += addParam(params, :search_category)
      uri += addParam(params, :search_hide_empty)
      uri += addParam(params, :search_order)
      uri += addParam(params, :search_has_wiki)
      uri += addParam(params, :search_name)

      getJSON(uri)
    end

    class << self
      def listing(params={})
        json = self.new.listing(params)
      end
    end

  end

end