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

    end
  end
end