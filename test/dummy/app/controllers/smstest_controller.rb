class SmstestController < ApplicationController
  require 'eniyismsapi'

  def home
    # 64335
    report_object = Eniyismsapi::REPORT.new '5444059964', '123456'
    rep = {msisdn: ' ', id:'64335'}
    @a = report_object.report rep

    bal = Eniyismsapi::REPORT.new '5444059964', '123456'
    @b = bal.balance
    #
    # sen = Eniyismsapi::SMS.new '5444059964', '123456'
    # params = {
      # coding: 'Default',
      # originator: 'EMRE KURT',
      # message: 'Ruby Gem Test API',
      # numbers: ['5444059964']
    # }
    # @send = sen.send params

    multi = Eniyismsapi::SMS.new '5444059964', '123456'
    params = {
      coding: 'Default',
      originator: 'EMRE KURT',
      messages: [
        {number: '5444059964', message: 'Emre Ruby GEM Api Test'},
        {number: '5424891217', message: 'Samet Ruby GEM Api Test (Mesaj ulastiysa eline haber ver bana)'}
      ]
    }

    @mul = multi.multi_send params



  end
end
