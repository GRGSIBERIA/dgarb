#-*- encoding: utf-8

require "./request/agent.rb"

module DGrab
  module Request
    class TagImplication < Agent
      def initialize()
        super
      end

      def listing(params={})
        uri = DANBOORU_URL + "tag_implications.json?"
        uri += addParams(params, :search_name_matches)
        uri += addParams(params, :search_antecedent_name)
        uri += addParams(params, :search_id)
        getJSON(uri)
      end

      DGrab::Request.listing(self)

    end
  end
end