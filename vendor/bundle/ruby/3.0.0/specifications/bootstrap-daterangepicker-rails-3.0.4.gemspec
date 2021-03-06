# -*- encoding: utf-8 -*-
# stub: bootstrap-daterangepicker-rails 3.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-daterangepicker-rails".freeze
  s.version = "3.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Grossman".freeze, "Jordan Brock".freeze]
  s.date = "2019-08-27"
  s.description = "Rails 4.1.x plugin to allow for the easy use of Dan Grossman's Bootstrap DateRangePicker".freeze
  s.email = "jordan@brock.id.au".freeze
  s.homepage = "http://github.com/jordanbrock/bootstrap-daterangepicker-rails".freeze
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Rails 4.1x plugin to allow for the easy use of Dan Grossman's Bootstrap DateRangePicker".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<railties>.freeze, [">= 4.0"])
    s.add_development_dependency(%q<test-unit>.freeze, ["~> 2.2"])
  else
    s.add_dependency(%q<railties>.freeze, [">= 4.0"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 2.2"])
  end
end
