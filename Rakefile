raise "jruby-hornetq must be built with JRuby: try again with `jruby -S rake'" unless defined?(JRUBY_VERSION)

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rake/clean'
require 'rake/testtask'
require 'date'
require 'java'
require 'hornetq/version'

desc "Build gem"
task :gem  do |t|
  gemspec = eval(File.read(File.expand_path('../jruby-hornetq.gemspec', __FILE__)))
  Gem::Builder.new(gemspec).build
end

desc "Run Test Suite"
task :test do
  Rake::TestTask.new(:functional) do |t|
    t.test_files = FileList['test/*_test.rb']
    t.verbose    = true
  end

  Rake::Task['functional'].invoke
end

