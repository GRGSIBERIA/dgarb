#-*- encoding: utf-8

require "./danbooru/agent.rb"

module DGrab
  module Agent
    class Artist < Agent
      def initialize()
        super
      end

      def listing(params={})
        uri = @url + "artists.json?"
        uri += addParam(params, :limit)
        uri += addParam(params, :page)
        uri += addParam(params, :search_name)
        uri += addParam(params, :search_id)
        uri += addParam(params, :search_order)  # can be name or date
        uri += addParam(params, :search_creator_name)
        uri += addParam(params, :search_creator_id)
        uri += addParam(params, :search_is_active)
        uri += addParam(params, :search_is_banned)
        uri += addParam(params, :search_empty_only)
        getJSON(uri)
      end

      def show(id)
        showID("artists", id)
      end
    end
  end

  module Artist
    def listing(params={})
      json = DGrab.Agent.Artist.new.listing(params)
    end

    def show(id)
      json = DGrab.Agent.Artist.new.show(params)
    end

    module_function :listing
    module_function :show
  end
end