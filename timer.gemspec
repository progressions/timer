
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "timer/version"

Gem::Specification.new do |spec|
  spec.name          = "timer"
  spec.version       = Timer::VERSION
  spec.authors       = ["Isaac Priestley"]
  spec.email         = ["progressions@gmail.com"]

  spec.summary       = %q{Simple timer to perform a block and display the elapsed time}
  spec.description   = %q{Simple timer to perform a block and display the elapsed time.}
  spec.homepage         = %q{http://github.com/progressions/timer}

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "natural_time", "~> 0.3.0"
  spec.add_dependency "timecop", "~> 0.9.1"
end
