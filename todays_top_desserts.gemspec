
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "todays_top_desserts/version"

Gem::Specification.new do |spec|
  spec.name          = "todays_top_desserts"
  spec.version       = TodaysTopDesserts::VERSION
  spec.authors       = ["krystlebarnes"]
  spec.email         = ["krystlecbarnes@gmail.com"]

  spec.summary       = %q{Find the recipes for today's top desserts.}
  spec.description   = %q{This Ruby gem installs a CLI that gives you the recipes for the top ten desserts being made today according to Allrecipes.com.}
  spec.homepage      = "https://github.com/krystlebarnes/todays-top-desserts-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = 'http://mygemserver.com'
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "colorize"

  spec.add_dependency "nokogiri", "~> 1.8.2"
end
