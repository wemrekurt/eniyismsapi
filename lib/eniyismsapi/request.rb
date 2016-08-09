# encoding: utf-8

require 'rest-client'
require 'crack/xml'

module Eniyismsapi
  class REQUEST
    def initialize path, params
      @params = params
      @api_base_url = "http://eniyisms.com/Api/#{path}"
      @path = path
    end

    def request
      begin
        resource = RestClient::Resource.new(@api_base_url, timeout: 30, open_timeout: 30)
        response = resource.post @params, content_type: :xml, accept: :xml
      rescue RestClient::ExceptionWithResponse => err
        response = err.response
      end
      if @path != 'Query'
        return Crack::XML.parse(response.body)
      else
        return response.body.split
      end
    end
  end
end
