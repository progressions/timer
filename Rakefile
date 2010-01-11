require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "timer"
    gem.summary = %Q{Simple timer to perform a block and display the elapsed time}
    gem.description = %Q{Simple timer to perform a block and display the elapsed time}
    gem.email = "progressions@gmail.com"
    gem.homepage = "http://github.com/progressions/timer"
    gem.authors = ["Jeff Coleman"]
    gem.add_development_dependency "ruby-growl", ">= 0"
    gem.add_development_dependency "progressions-g", ">= 0"
    gem.add_development_dependency "rspec", ">= 0"
    gem.add_development_dependency "timecop", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
desc 'run all specs'
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['-c']
end
