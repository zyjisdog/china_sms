# -*- encoding: utf-8 -*-
# stub: china_sms 0.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "china_sms".freeze
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["saberma".freeze]
  s.date = "2018-04-01"
  s.description = "a gem for chinese people to send sms".freeze
  s.email = ["mahb45@gmail.com".freeze]
  s.files = [".gitignore".freeze, ".travis.yml".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "china_sms.gemspec".freeze, "lib/china_sms.rb".freeze, "lib/china_sms/service/chanyoo.rb".freeze, "lib/china_sms/service/emay.rb".freeze, "lib/china_sms/service/luosimao.rb".freeze, "lib/china_sms/service/smsbao.rb".freeze, "lib/china_sms/service/tui3.rb".freeze, "lib/china_sms/service/yunpian.rb".freeze, "lib/china_sms/version.rb".freeze, "spec/china_sms_spec.rb".freeze, "spec/service/chanyoo_spec.rb".freeze, "spec/service/emay_spec.rb".freeze, "spec/service/luosimao_spec.rb".freeze, "spec/service/smsbao_spec.rb".freeze, "spec/service/tui3_spec.rb".freeze, "spec/service/yunpian_spec.rb".freeze, "spec/spec_helper.rb".freeze]
  s.homepage = "https://github.com/saberma/china_sms".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "a gem for chinese people to send sms".freeze
  s.test_files = ["spec/china_sms_spec.rb".freeze, "spec/service/chanyoo_spec.rb".freeze, "spec/service/emay_spec.rb".freeze, "spec/service/luosimao_spec.rb".freeze, "spec/service/smsbao_spec.rb".freeze, "spec/service/tui3_spec.rb".freeze, "spec/service/yunpian_spec.rb".freeze, "spec/spec_helper.rb".freeze]

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.2"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2"])
      s.add_dependency(%q<webmock>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.2"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end
