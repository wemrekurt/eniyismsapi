# Eniyi Sms API

eniyisms.com api kullanarak bakiye sorgulama, raporlama, sms gönderme işlemleri için hazırlanan Ruby GEM'i.

[![Gem Version](https://badge.fury.io/rb/eniyismsapi.svg)](https://badge.fury.io/rb/eniyismsapi)

## Installation

```sh
$ gem install 'eniyismsapi'
```
## Knowledge
    - username: eniyisms.com üye olduğunuz kullanıcı adı
    - password: eniyisms.com üye olduğunuz şifreniz
    - originator: eniyisms.com üye olduktan sonra aldığınız başlık (originator)
## Usage Examples
### Get Report
```sh
    require 'eniyismsapi'
    report_object = Eniyismsapi::REPORT.new '544xxxxxxx', '123456' #First: Username, Second: Password
    params = {msisdn: ' ', id:'123xx'}
    @response = report_object.report params
```
### Get Balance

```sh
    require 'eniyismsapi'
    getBal = Eniyismsapi::REPORT.new '544xxxxxxx', '123456' #First: Username, Second: Password
    @balance = getBal.balance
```
### Send Sms

```sh
    sendSms = Eniyismsapi::SMS.new '544xxxxxxx', '123456' #First: Username, Second: Password
    params = {
       coding: 'Default', # Can be Turkish, Default, UCS2
       originator: 'EMRE KURT',
       message: 'Ruby Gem Test API',
       numbers: ['544xxxxxxx','90542xxxxxxx']
    }
     @send = sendSms.send params
```

### Send To Multi Receivers
```sh
    multi = Eniyismsapi::SMS.new '544xxxxxxx', '123456' #First: Username, Second: Password
    params = {
      coding: 'Default', # Can be Turkish, Default, UCS2
      originator: 'EMRE KURT',
      messages: [
        {number: '544xxxxxxx', message: 'Emre Ruby GEM Api Test'},
        {number: '542xxxxxxx', message: 'Samet Ruby GEM Api Test'}
      ]
    }
    @response = multi.multi_send params
```

## API Dökümanı
Lütfen [eniyisms.com](http://www.eniyisms.com)'dan api dökümanı isteyip hesabınız için api kullanımının aktifleştirilmesini talep ediniz.
