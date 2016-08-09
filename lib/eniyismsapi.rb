# encoding: utf-8

require File.expand_path('../eniyismsapi/send', __FILE__)
require File.expand_path('../eniyismsapi/report', __FILE__)
require File.expand_path('../eniyismsapi/request', __FILE__)

module Eniyismsapi

  def self.report username, password, argv
    sms = REPORT.new username, password
    sms.report argv
  end

  def self.balance username, password
    sms = REPORT.new username, password
    sms.balance
  end

  def self.send username, password, params
    sms = SMS.new username, password
    sms.send params
  end

  def self.multi_send username, password, params
    sms = SMS.new username, password
    sms.multi_send params
  end
end
