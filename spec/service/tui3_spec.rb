# encoding: utf-8
require 'spec_helper'

describe "Tui3" do
  describe "#to" do
    let(:password) { '50e7a3smdl521942ea38dnf4b58c5e6b' }
    let(:url) { "http://tui3.com/api/send/" }
    let(:content) { '推立方测试：深圳 Rubyist 活动时间变更到明天下午 7:00，请留意。' }
    subject { ChinaSMS::Service::Tui3.to phone, content, password: password }

    describe 'single phone' do
      let(:phone) { '13928452888' }

      before do
        stub_request(:post, url).
          with(body: {k: password, t: phone, c: content, p: '1', r: 'json'}).
          to_return(body: '{"err_code":0,"err_msg":"操作成功！","server_time":"2013-07-01 21:42:37"}' )
      end

      its([:success]) { should eql true }
      its([:code]) { should eql 0 }
      its([:message]) { should eql "操作成功！" }
    end

    describe 'multiple phones' do
      let(:phone) { ['13928452888', '13590142385'] }

      before do
        stub_request(:post, url).
          with(body: {k: password, t: phone.join(','), c: content, p: '1', r: 'json'}).
          to_return(body: '{"err_code":0,"err_msg":"操作成功！","server_time":"2013-07-01 21:42:37"}' )
      end

      its([:success]) { should eql true }
      its([:code]) { should eql 0 }
      its([:message]) { should eql "操作成功！" }
    end

    context 'invalid key' do
      let(:phone) { '13928452888' }
      let(:password) { '666666' }

      before do
        stub_request(:post, url).
          with(body: {k: password, t: phone, c: content, p: '1', r: 'json'}).
          to_return(body: 'invalid parameters' )
      end

      its([:success]) { should eql false }
      its([:message]) { should eql "非法apikey:#{password}" }
    end

  end
end
