class SmstestController < ApplicationController
  require 'eniyismsapi'

  def home
    # 64335
    report_object = Eniyismsapi::REPORT.new '5444059964', '123456'
    rep = {msisdn: ' ', id:'64335'}
    @a = report_object.report rep

    bal = Eniyismsapi::REPORT.new '5444059964', '123456'
    @b = bal.balance

    sen = Eniyismsapi::SMS.new '5444059964', '123456'
    params = {
      coding: 'Default',
      originator: 'EMRE KURT',
      message: 'Ruby Gem Test API',
      numbers: ['5444059964']
    }
    @send = sen.send params
  end
end
