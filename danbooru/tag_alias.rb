#-*- encoding: utf-8

require "./danbooru/agent.rb"

module DW
  class TagAlias < Agent
    def initialize()
      super
    end

    def listing(params={})
      uri = @url + "tag_aliases.json?"
      uri += addParams(params, :search_name_matches)
      uri += addParams(params, :search_antecedent_name)
      uri += addParams(params, :search_id)
      getJSON(uri)
    end
  end
end