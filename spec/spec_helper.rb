require 'jekyll'
require 'liquid'
require 'rspec'
require 'fakefs/spec_helpers'
require_relative '../lib/jekyll-code-example-tag.rb'

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true
end
