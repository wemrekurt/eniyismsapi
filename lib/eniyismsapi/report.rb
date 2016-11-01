# encoding: utf-8

require "eniyismsapi/request"
require 'nokogiri'

module Eniyismsapi
  class REPORT
    def initialize(username, password)
      @username = username
      @password = password
    end

    def report argv
      path = "Query"

      ns = {
        "xmlns:i" => "http://www.w3.org/2001/XMLSchema-instance" ,
        "xmlns"=>'SmsApi'
      }

      xml_build = Nokogiri::XML::Builder.new do |xml|
        xml.Query(ns){
          xml.Credential {
            xml.Password @password
            xml.Username @username
          }
          xml.MSISDN argv[:msisdn]
          xml.MessageId argv[:id]
        }
      end
      r = REQUEST.new path,xml_build.to_xml
      return r.request
    end

    def balance
      path = "GetBalance"
      ns = {
        "xmlns:i" => "http://www.w3.org/2001/XMLSchema-instance" ,
        "xmlns"=>'SmsApi'
      }

      xml_build = Nokogiri::XML::Builder.new do |xml|
        xml.GetBalance(ns) {
          xml.Credential {
            xml.Password @password
            xml.Username @username
          }
        }
      end
      r = REQUEST.new path, xml_build.to_xml
      return r.request
    end

  end
end
