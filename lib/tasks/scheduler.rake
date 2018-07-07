desc "This task is calles by the Herkoku scheduler add-on"
task :update_feed => :enviroment do
  require 'line/bot'
  require 'open-uri'
  require 'kconb'
  require 'rexml/document'

  Client || = Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
  }

  url = "https://www.drk7.jp/weather/xml/13.xml"

  xml = open( url ).read.toutf8
  doc = REXML::Document.new(xml)

  xpath = 'weatherforecast/pref//area[4]/info/rainfallchace/'

  per06to12 = doc.elements[xpath + 'period[2]'].text
  per12to18 = doc.elements[xpath + 'period[3]'].text
  per18to24 = doc.elements[xpath + 'period[4]'].text