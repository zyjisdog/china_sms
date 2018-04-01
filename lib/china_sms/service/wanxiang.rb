require 'json'

module ChinaSMS
  module Service
    module Wanxiang
      extend self

      URL = "https://way.jd.com"
      Provider = "kaixintong/kaixintong"

      MESSAGES = {
        10000: '短信发送成功',
        10001: '错误的请求appkey',
        11010: '商家接口调用异常，请稍后再试',
        11030: '商家接口返回格式有误',
        10003: '不存在相应的数据信息',
        10004: 'URL上appkey参数不能为空',
        10010: '接口需要付费，请充值',
        10020: '万象系统繁忙，请稍后再试',
        10030: '调用万象网关失败， 请与万象联系',
        10040: '超过每天限量，请明天继续',
        10050: '用户已被禁用',
        10060: '提供方设置调用权限，请联系提供方'
      }

      def to(phone, content, options)
        phones = Array(phone).join(',')
        res = Net::HTTP.post_form(URI.parse("#{URL}/#{Provider}"), mobile: phones, content: content,appkey: options[:password])
        result res.body
      end

      def result(body)
        JSON.parse body
        {
          success: body['code'] == "10000",
          code: body['code'],
          message: body['msg'],
          charge: body['charge']
        }
      end

    end
  end
end