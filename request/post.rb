#-*- encoding: utf-8
require "./request/agent"

module DGrab
  module Request

    class Post < Agent
      def initialize()
        super
      end

      def _addParam(params, typename)
        uri = ""
        if params.has_key?(typename) then
          if typename == :tags then
            if params[typename].class == Array then
              uri = typename.to_s + "=#{params[typename].join(" ")}"
            else
              uri = typename.to_s + "=#{params[typename]}"
            end
            uri += "&"
          end
        end
        uri
      end

      def _createURI(params)
        uri = DANBOORU_URL + "posts.json?"
        uri +=  addParam(params, :page)
        uri +=  addParam(params, :limit)
        uri += _addParam(params, :tags)
        uri +=  addParam(params, :raw)
        uri
      end

      def listing(params={})
        result = nil
        if params[:page].class == Range then  # 範囲オブジェクトかどうかで処理を切り分ける
          result = []
          range = params[:page]
          for i in range
            params[:page] = i
            uri = _createURI(params)
            result += getJSON(uri)
          end
        else
          uri = _createURI(params)
          result = getJSON(uri)
        end
        result
      end

      def show(id)
        showID("posts", id)
      end

      DGrab::Request.listing(self)
      DGrab::Request.show(self)

    end
  end
end