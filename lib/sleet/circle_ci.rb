# frozen_string_literal: true

require 'singleton'

module Sleet
  class CircleCi
    include Singleton

    def token
      @_token ||= File.read("#{Dir.home}/.circleci.token").strip
    end

    def get(url)
      Faraday.get(url, circleci_token: token)
    end

    def self.get(url)
      instance.get(url)
    end
  end
end
