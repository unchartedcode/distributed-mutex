# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'distributed_mutex/version'

Gem::Specification.new do |spec|
  spec.name          = "distributed-mutex"
  spec.version       = DistributedMutex::VERSION
  spec.authors       = ["Nathan Palmer"]
  spec.email         = ["nathan@nathanpalmer.com"]

  spec.summary       = %q{Distributed Mutex to allow mutual-exclusion via acquiring locks between multiple processes or machines}
  spec.description   = %q{
    This gem allows you to lock specific chunks of code based on a shared key. It's a Mutex, but locks beyond a single machine by utilizing Redis's SETNX.
  }
  spec.homepage      = "https://github.com/unchartedcode/distributed-mutex"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 0'
  spec.add_development_dependency "mock_redis", '~> 0'
  spec.add_development_dependency "byebug", '~> 0'
  spec.add_development_dependency "coveralls", '~> 0'

  spec.add_dependency "redis", '~> 0'
end
