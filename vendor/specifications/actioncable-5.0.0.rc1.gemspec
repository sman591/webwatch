# -*- encoding: utf-8 -*-
# stub: actioncable 5.0.0.rc1 ruby lib

Gem::Specification.new do |s|
  s.name = "actioncable"
  s.version = "5.0.0.rc1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Pratik Naik", "David Heinemeier Hansson"]
  s.date = "2016-05-06"
  s.description = "Structure many real-time application concerns into channels over a single WebSocket connection."
  s.email = ["pratiknaik@gmail.com", "david@loudthinking.com"]
  s.homepage = "http://rubyonrails.org"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2")
  s.rubygems_version = "2.4.5.1"
  s.summary = "WebSocket framework for Rails."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, ["= 5.0.0.rc1"])
      s.add_runtime_dependency(%q<nio4r>, ["~> 1.2"])
      s.add_runtime_dependency(%q<websocket-driver>, ["~> 0.6.1"])
    else
      s.add_dependency(%q<actionpack>, ["= 5.0.0.rc1"])
      s.add_dependency(%q<nio4r>, ["~> 1.2"])
      s.add_dependency(%q<websocket-driver>, ["~> 0.6.1"])
    end
  else
    s.add_dependency(%q<actionpack>, ["= 5.0.0.rc1"])
    s.add_dependency(%q<nio4r>, ["~> 1.2"])
    s.add_dependency(%q<websocket-driver>, ["~> 0.6.1"])
  end
end
