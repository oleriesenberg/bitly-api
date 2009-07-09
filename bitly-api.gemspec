# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bitly-api}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ole Riesenberg"]
  s.date = %q{2009-07-09}
  s.description = %q{Small library to access bitly api}
  s.email = ["or@oleriesenberg.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "bitly-api.gemspec", "lib/bitly-api.rb", "lib/bitly-api/bitly-api.rb", "script/console", "script/destroy", "script/generate", "test/test_bitly-api.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/Hoodow/bitly-api}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bitly-api}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Small library to access bitly api}
  s.test_files = ["test/test_helper.rb", "test/test_bitly-api.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.4.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.4.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
