#-*- encoding: utf-8
require "./agent"

module DW

  class Post < Agent
    def initialize()
      super
    end

    def _addParam(params, uri, typename, flag)
      if params.has_key?(typename) then
        uri += flag ? "&" : "?"
        if typename == :tags then
          uri += "tags=" + params[:tags].join(" ")
        else
          uri += typename.to_s + "=#{params[typename]}"
        end
        flag = true
      end
      [uri, flag]
    end

    def listing(params={})
      uri = @url + "posts.json"
      flag = false
      uri, flag = _addParam(params, uri, :page, flag)
      uri, flag = _addParam(params, uri, :limit, flag)
      uri, flag = _addParam(params, uri, :tags, flag)
      uri, flag = _addParam(params, uri, :raw, flag)

      JSON::parse(@agent.get(uri).body)
    end

    def show(id)
      uri = @url + "posts/#{id}.json"
      JSON::parse(@agent.get(uri).body)
    end

  end

end