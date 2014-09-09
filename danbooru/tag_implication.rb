#-*- encoding: utf-8

require "./danbooru/agent.rb"

module DGrab
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

    class << self
      def listing(params={})
        json = self.new.listing(params)
      end
    end

  end

end