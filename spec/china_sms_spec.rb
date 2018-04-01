# encoding: utf-8
require 'spec_helper'

describe "ChinaSMS" do
  let(:service) { :tui3 }
  let(:username) { 'saberma' }
  let(:password) { '666666' }
  let(:phone) { '13928452841' }
  let(:content) { '活动通知：深圳 Rubyist 活动时间变更到明天下午 7:00，请留意。' }

  context 'with service' do
    before { ChinaSMS.use service, username: username, password: password }

    describe "#use" do
      subject { ChinaSMS }
      its(:username) { should eql "saberma"}
    end

    describe "#to" do
      subject { ChinaSMS.to(phone, content) }
      before { ChinaSMS::Service::Tui3.stub(:to).with(phone, content, username: username, password: password).and_return(success: true, code: 0) }
      its([:success]) { should eql true }
      its([:code]) { should eql 0 }
    end

    describe 'with voice service' do
      let(:content){ '8888' }

      describe "#voice_to" do
        let(:service) { :yunpian }
        subject { ChinaSMS.voice_to(phone, content) }
        before { ChinaSMS::Service::Yunpian.stub(:voice_to).with(phone, content, username: username, password: password).and_return(success: true, code: 0) }
        its([:success]) { should eql true }
        its([:code]) { should eql 0 }
      end

      describe '#voice_to not provided' do
        let(:content){ '8888' }
        it 'should raise ServiceNotProvided' do
          expect { ChinaSMS.voice_to(phone, content)}.to raise_error(ChinaSMS::ServiceNotProvided)
        end
      end
    end

  end

  context 'without service' do
    before { ChinaSMS.clear }

    describe '#to' do
      it 'should be ignore' do
        ChinaSMS.to(phone, content)
      end
    end

  end

end
