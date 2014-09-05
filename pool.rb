#-*- encoding: utf-8

require "./agent.rb"

module DW
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