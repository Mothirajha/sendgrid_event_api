lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sendgrid_event_api/version"

Gem::Specification.new do |s|
  s.name          = 'sendgrid_event_api'
  s.version       = SendgridEventApi::VERSION
  s.summary       = "Sendgrid Event Api"
  s.description   = "Process with your out bound and spam emails"
  s.authors       = ["Mothirajha"]
  s.email         = 'rajha12@gmail.com'
  s.homepage      = "https://github.com/mothirajha/sendgrid_event_api"
  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.require_paths = ["lib"]
  s.license       = 'MIT'

  s.add_dependency 'faraday', '~> 0.9.2'
end