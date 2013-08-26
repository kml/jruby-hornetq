# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hornetq/version'
require 'date'
require 'rake'

Gem::Specification.new do |s|
  s.name        = 'jruby-hornetq'
  s.version     = HornetQ::VERSION
  s.authors     = ['Reid Morrison', 'Brad Pardee']
  s.email       = ['reidmo@gmail.com', 'bpardee@gmail.com']
  s.homepage    = 'https://github.com/ClarityServices/jruby-hornetq'
  s.date        = Date.today.to_s
  s.description = 'JRuby-HornetQ is a Java and Ruby library that exposes the HornetQ Java API in a ruby friendly way. For JRuby only.'
  s.summary     = 'JRuby interface into HornetQ'
  s.files       = Rake::FileList["./**/*"].exclude(/.gem$/, /.log$/,/^nbproject/).map{|f| f.sub(/^\.\//, '')}
  s.license     = "Apache License V2.0"
  s.has_rdoc    = true
  s.executables = %w(hornetq_server)
  s.add_dependency "gene_pool", "~> 1.1.1"
end
