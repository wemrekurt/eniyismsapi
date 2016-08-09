# encoding: utf-8

require 'nokogiri'
require "eniyismsapi/request"

module Eniyismsapi
  class SMS
    def initialize username, password
      @username = username
      @password = password
    end

    # Usage: sms = Eniyismsapi::SMS.new("5444059964","123456")
    #        sms.send({sender: "GLOBALMEDIA", message: "Lorem Ipsum ...",
    #                 numbers: ["05xxxxxxxxx", "5xxxxxxxxx"]})
    # Description: Single Message to Multiple Recipients
    def send params
      path = "Submit"
      params = {sendDateTime: Time.now.strftime("%d/%m/%Y %H:%M")}.merge(params)

      ns = {
        "xmlns:i" => "http://www.w3.org/2001/XMLSchema-instance" ,
        "xmlns"=>'SmsApi'
      }

      ms = {
        'xmlns:d2p1' => 'http://schemas.microsoft.com/2003/10/Serialization/Arrays'
      }

      build_xml = Nokogiri::XML::Builder.new do |xml|
        xml.Submit(ns) {
          xml.Credential {
            xml.Username @username
            xml.Password @password
          }
          xml.DataCoding params[:coding]
          xml.Header{
            xml.From params[:originator]
            xml.ScheduledDeliveryTime params[:sendDateTime]
          }
          xml.Message params[:message]
          xml.To(ms){
            params[:numbers].each do |nmb|
              xml['d2p1'].string nmb
            end
          }
        }
      end
      r = REQUEST.new path, build_xml.to_xml
      return r.request
      # return build_xml.to_xml
    end

    # Usage: sms = IletimerkeziSMS::SMS.new("5545967632","5173539")
    #        sms.send({sender: "ILETI MRKZI",
    #                   messages: [
    #                     {text: "Message_one", numbers: ["905xxxxxxxxx"," +90 5xx xxx xx xx", "5xxxxxxxxx"]},
    #                     {text: "Message_two", numbers: ["905xxxxxxxxx"," +90 5xx xxx xx xx"]},
    #                     {text: "Message_there", numbers: ["905xxxxxxxxx"]}
    #                   ]
    #                 })
    # Description: Multi Message => Multi Number (Birden fazla farklı mesajı birden fazla farklı kişiye göndermeye yarar.)

     def multi_send params
      path = "SubmitMulti"
      params = {sendDateTime: Time.now.strftime("%d/%m/%Y %H:%M")}.merge(params)

      ns = {
        "xmlns:i" => "http://www.w3.org/2001/XMLSchema-instance" ,
        "xmlns"=>'SmsApi'
      }

      multi_xml = Nokogiri::XML::Builder.new do |xml|
        xml.SubmitMulti(ns) {
          xml.Credential {
            xml.Password @password
            xml.Username @username
          }
          xml.DataCoding params[:coding]
          xml.Header {
            xml.From params[:originator]
            xml.ScheduledDeliveryTime params[:sendDateTime]
          }
          xml.Envelopes {
            params[:messages].each do |msg|
              xml.Envelope{
                xml.Message msg[:message]
                xml.To msg[:number]
              }
            end
          }
        }
      end
      r = REQUEST.new path, multi_xml.to_xml
      return r.request
    end

    # Usage: sms = IletimerkeziSMS::SMS.new("5545967632","5173539")
    #        sms.cancel("4152")
    # Description: Gönderilen sms paketini iptal etmeye yarar.
    # def cancel(order_id)
    #   path = "cancel-order"
    #   xml_build = Nokogiri::XML::Builder.new do |xlm|
    #     xlm.request {
    #       xlm.authentication {
    #         xlm.username @username
    #         xlm.password @password
    #       }
    #       xlm.order {
    #         xlm.id_ order_id.to_s
    #       }
    #     }
    #   end
    #   r = REQUEST.new(path,xml_build.to_xml)
    #   return r.request
    # end


  end
end
