# frozen_string_literal: true

require_relative "lib/r00lz/version"

Gem::Specification.new do |spec|
  spec.name          = "r00lz"
  spec.version       = R00lz::VERSION
  spec.authors       = ["My own Ruby framework"]
  spec.email         = ["melo.theo@outlook.com"]

  spec.summary       = "A Rack-based framework"
  spec.description   = "A Rack-baes framwework"
  spec.homepage      = ""
  spec.required_ruby_version = ">= 2.4.0"

  spec.add_runtime_dependency "rack"

  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
