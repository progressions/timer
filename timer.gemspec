# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{timer}
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Isaac Priestley"]
  s.date = %q{2012-08-26}
  s.description = %q{Simple timer to perform a block and display the elapsed time. Growls message if growl is turned on.}
  s.email = %q{progressions@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "History.txt",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/timer.rb",
    "spec/timer_spec.rb",
    "timer.gemspec"
  ]
  s.homepage = %q{http://github.com/progressions/timer}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Simple timer to perform a block and display the elapsed time}
  s.test_files = [
    "spec/timer_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-growl>, [">= 0"])
      s.add_runtime_dependency(%q<progressions-g>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<natural_time>, [">= 0"])
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<timecop>, [">= 0"])
      s.add_runtime_dependency(%q<ruby-growl>, [">= 0"])
      s.add_runtime_dependency(%q<progressions-g>, [">= 0"])
      s.add_runtime_dependency(%q<natural_time>, [">= 0"])
    else
      s.add_dependency(%q<ruby-growl>, [">= 0"])
      s.add_dependency(%q<progressions-g>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<natural_time>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<ruby-growl>, [">= 0"])
      s.add_dependency(%q<progressions-g>, [">= 0"])
      s.add_dependency(%q<natural_time>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby-growl>, [">= 0"])
    s.add_dependency(%q<progressions-g>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<natural_time>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<ruby-growl>, [">= 0"])
    s.add_dependency(%q<progressions-g>, [">= 0"])
    s.add_dependency(%q<natural_time>, [">= 0"])
  end
end

