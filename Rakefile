require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "timer"
    gem.summary = %Q{Simple timer to perform a block and display the elapsed time}
    gem.description = %Q{Simple timer to perform a block and display the elapsed time. Growls message if growl is turned on.}
    gem.email = "progressions@gmail.com"
    gem.homepage = "http://github.com/progressions/timer"
    gem.authors = ["Jeff Coleman"]
    gem.add_runtime_dependency "ruby-growl", ">= 0"
    gem.add_runtime_dependency "progressions-g", ">= 0"
    gem.add_runtime_dependency "natural_time", ">= 0"
    gem.add_development_dependency "rspec", ">= 0"
    gem.add_development_dependency "timecop", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
  spec.spec_opts = ['-c']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "translator #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
