# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dunder/version"

Gem::Specification.new do |s|
  s.name        = "dunder"
  s.version     = Dunder::VERSION
  s.authors     = ["Craig R Webster"]
  s.email       = ["craig@barkingiguana.com"]
  s.homepage    = ""
  s.summary     = %q{A terribly naive DNS zone server}
  s.description = %q{Use Latte and DNS::Zonefile to serve text based zonefiles via DNS. This is a toy project, I don't intend to use it in production anywhere.}

  s.rubyforge_project = "dunder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "latte"
  s.add_runtime_dependency "dns-zonefile"
end
