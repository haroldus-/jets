source "https://rubygems.org"

# Specify your gem dependencies in jets.gemspec
gemspec

# required here for specs
# TODO: Only require webpacker in Gemfile of project if possible.
# Need both because of jets/application.rb and jets/webpacker/middleware_setup.rb
group :development, :test do
  gem "pg", "=0.21"
  gem "webpacker", git: "https://github.com/tongueroo/webpacker.git", branch: "jets"
  gem "rspec_junit_formatter"
end
