#-*- encoding: utf-8

require "./danbooru/agent.rb"

module DGrab
  module Agent
    class Pool < Agent
      def initialize()
        super
      end

      def show(id)
        showID("pools", id)
      end

      def listing(params={})
        uri = @url + "pools.json?"
        uri += addParams(params, :search_name_matches)
        uri += addParams(params, :search_description_matches)
        uri += addParams(params, :search_creator_name)
        uri += addParams(params, :search_creator_id)
        uri += addParams(params, :search_is_active)
        uri += addParams(params, :search_order)
        uri += addParams(params, :search_category)
        getJSON(uri)
      end
    end
  end

  module Pool
    def listing(params={})
      json = DGrab.Agent.Pool.new.listing(params)
    end

    def show(id)
      json = DGrab.Agent.Pool.new.show(params)
    end

    module_function :listing
    module_function :show
  end
end