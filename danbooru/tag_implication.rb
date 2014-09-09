#-*- encoding: utf-8

require "./danbooru/agent.rb"

module DGrab
  module Agent
    class TagImplication < Agent
      def initialize()
        super
      end

      def listing(params={})
        uri = @url + "tag_implications.json?"
        uri += addParams(params, :search_name_matches)
        uri += addParams(params, :search_antecedent_name)
        uri += addParams(params, :search_id)
        getJSON(uri)
      end
    end
  end

  module TagImplication
    def listing(params={})
      json = DGrab.Agent.TagImplication.new.listing(params)
    end

    module_function :listing
  end
end