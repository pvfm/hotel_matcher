# frozen_string_literal: true

require_relative "lib/hotel_matcher/version"

Gem::Specification.new do |spec|
  spec.name = "hotel_matcher"
  spec.version = HotelMatcher::VERSION
  spec.authors = ["Pedro Monteiro"]
  spec.email = ["pvmonteiro26@gmail.com"]

  spec.summary = "Olery backend developer"
  spec.description = "Search hotel in some web sites and return url"
  spec.homepage = "https://example.com"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/pvfm/hotel_matcher"
  spec.metadata["changelog_uri"] = "https://github.com/pvfm/hotel_matcher/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "mechanize"
  spec.add_dependency "byebug"
  spec.add_dependency "json"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
