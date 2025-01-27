# frozen_string_literal: true

require_relative "lib/rapidmail/version"

Gem::Specification.new do |spec|
  spec.name = "rapidmail"
  spec.version = Rapidmail::VERSION
  spec.authors = ["Martin Schneider"]
  spec.email = ["m.schneider@cortona.de"]

  spec.license = "MIT"

  spec.summary = "A Ruby wrapper for the Rapidmail API"
  spec.description = "Rapidmail is a Ruby gem that provides an easy-to-use interface for interacting with the Rapidmail newsletter service API."
  spec.homepage = "https://cortona.de"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cortona/rapidmail-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/cortona/rapidmail-ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.0" # HTTP client for API requests
  spec.add_dependency "json", "~> 2.0" # JSON parsing and generation
  spec.add_dependency "rubyzip", "~> 2.0" # ZIP file creation

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
