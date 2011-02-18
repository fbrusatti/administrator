# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "administrator/version"

Gem::Specification.new do |s|
  s.name        = "administrator"
  s.version     = "0.0.1"

  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Franco Brusatti"]
  s.email       = ["fbrusatti@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/administrator"
  s.summary     = %q{Administrator is a Rails admin interface generator}
  s.description = %q{another automatization to create an admin dashboard panel with authorization}

  s.rubyforge_project = "administrator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
