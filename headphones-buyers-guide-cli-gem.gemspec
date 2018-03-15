
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "./lib/headphones-buyers-guide-cli-gem/version"

Gem::Specification.new do |spec|
  spec.name          = "headphones-buyers-guide-cli-gem"
  spec.version       = Headphones::VERSION
  spec.authors       = ["Ariel Feingold"]
  spec.email         = ["feingold.ariel@gmail.com"]

  spec.summary       = %q{This App scrapes the c|net for best hedphones and prsents it to the user.}
  spec.homepage      = "https://rubygems.org/gems/headphones-buyers-guide-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = ["lib/headphones-buyers-guide-cli-gem.rb", "./lib/headphones-buyers-guide-cli-gem/cli.rb", "./lib/headphones-buyers-guide-cli-gem/scraper.rb", "./lib/headphones-buyers-guide-cli-gem/version.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
