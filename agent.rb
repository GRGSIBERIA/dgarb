#-*- encoding: utf-8
require "mechanize"

module DW
  class Agent
    def initialize()
      @url = "https://danbooru.donmai.us/"
      @agent = Mechanize.new
    end
  end
end