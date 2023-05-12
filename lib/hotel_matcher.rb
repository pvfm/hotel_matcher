# frozen_string_literal: true

require_relative "hotel_matcher/version"
require "byebug"
require "mechanize"
require "json"

module HotelMatcher
  class Hotel
    attr_reader :hotel_name
    def initialize(hotel_name)
      @hotel_name = hotel_name
    end

    def self.find(hotel_name)
      new(hotel_name).find
    end

    def find
      initialize_mechanize

      booking_link = booking_request
      holidaycheck_link = holidaycheck_request

      return {
        booking: "#{booking_link} for booking.com",
        holidaycheck: "#{holidaycheck_link} for holidaycheck.de",
      }
    end

    private 
    
    def initialize_mechanize
      @mec = Mechanize.new
      @mec.user_agent_alias = 'Windows Chrome'
    end

    def booking_request
      @mec.get("https://www.booking.com")

      @mec.page.form.ss = hotel_name
      @mec.page.form.submit

      @mec.page.search("h3 a").first.attributes["href"].value
    end

    def holidaycheck_request
      @mec.get("https://www.holidaycheck.de/svc/search-mixer/search?query=#{hotel_name}&tenant=hc-search&page=/&scope=package&travelkind=package")

      json_data = JSON.parse(@mec.page.body)
      suffix_url = json_data["transformedResults"][0]["link"]

      "https://www.holidaycheck.de#{suffix_url}"
    end
  end
end
