#-*- encoding: utf-8
require "./agent"

module DW

  class Post < Agent
    def initialize()
      super
    end

    def _addParam(params, typename)
      uri = ""
      if params.has_key?(typename) then
        if typename == :tags then
          uri = typename.to_s + "=#{params[typename]}"
          uri += "&"
        end
      end
      uri
    end

    def listing(params={})
      uri = @url + "posts.json?"
      uri +=  addParam(params, :page)
      uri +=  addParam(params, :limit)
      uri += _addParam(params, :tags)
      uri +=  addParam(params, :raw)

      getJSON(uri)
    end

    def show(id)
      showID("posts", id)
    end

  end

end