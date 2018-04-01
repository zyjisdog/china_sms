# encoding: utf-8
require "china_sms/version"
require 'net/http'
Dir.glob("#{File.expand_path(File.dirname(__FILE__))}/china_sms/service/*.rb").sort.each do |f|
  require f.match(/(china_sms\/service\/.*)\.rb$/)[0]
end

module ChinaSMS
  extend self

  class ServiceNotProvided < StandardError;end

  attr_reader :username, :password

  def use(service, options)
    @service = ChinaSMS::Service.const_get("#{service.to_s.capitalize}")
    @service.const_set("URL", options[:base_uri]) if options[:base_uri]
    @service.const_set("Provider", options[:provider]) if options[:provider]
    @username = options[:username]
    @password = options[:password]
  end

  def to(receiver, content, options = {})
    options = default_options.merge options
    @service.to receiver, content, options if @service
  end

  def voice_to(receiver, content, options={})
    options = default_options.merge options
    if @service
      if @service.respond_to?(:voice_to)
        @service.voice_to receiver, content, options
      else
        raise ServiceNotProvided, "#{@service.name} not provide voice_to service!"
      end
    end
  end

  def get(options = {})
    options = default_options.merge options
    @service.get options if @service
  end

  def clear
    @service = @username = @password = nil
  end

  private

  def default_options
    {
      username:  @username,
      password:  @password
    }
  end

end
