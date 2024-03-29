#-*- encoding: utf-8

require "./request/agent.rb"

module DGrab
  module Request
    class Artist < Agent
      def initialize()
        super
      end

      def listing(params={})
        uri = DANBOORU_URL + "artists.json?"
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

      DGrab::Request.listing(self)
      DGrab::Request.show(self)

    end
  end

end