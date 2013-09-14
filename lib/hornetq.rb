include Java

module HornetQ

  # Netty Class name
  NETTY_CONNECTOR_CLASS_NAME = 'org.hornetq.core.remoting.impl.netty.NettyConnectorFactory'
  NETTY_ACCEPTOR_CLASS_NAME  = 'org.hornetq.core.remoting.impl.netty.NettyAcceptorFactory'
  INVM_CONNECTOR_CLASS_NAME  = 'org.hornetq.core.remoting.impl.invm.InVMConnectorFactory'
  INVM_ACCEPTOR_CLASS_NAME   = 'org.hornetq.core.remoting.impl.invm.InVMAcceptorFactory'

  DEFAULT_NETTY_PORT     = java.lang.Integer.new(5445)
  DEFAULT_DATA_DIRECTORY = './data'

  # Allow override of our included jars so we don't have to keep up with hornetq releases
  def self.require_jar(jar_name)
    base_dir = ENV['HORNETQ_HOME'] ? "#{ENV['HORNETQ_HOME']}/lib" : File.expand_path("../../vendor", __FILE__)
    jars = Dir[File.join(base_dir, "#{jar_name}-[0-9]*.jar")]
    raise ArgumentError, "Too many matching jars for #{jar_name.inspect}: #{jars}" if jars.size > 1
    if jars.size == 0
      if File.exist?(File.join(base_dir, "#{jar_name}.jar"))
        jars << jar_name
      else
        raise LoadError, "no such jar to load -- #{jar_name}"
      end
    end

    require jars.first
  end

  def self.netty_port(port)
    port ||= DEFAULT_NETTY_PORT
    return java.lang.Integer.new(port)
  end

  # Convert string into a HornetQ SimpleString
  def self.as_simple_string(str)
   str.is_a?(Java::org.hornetq.api.core::SimpleString) ? str : Java::org.hornetq.api.core::SimpleString.new(str.to_s)
  end

end

require 'hornetq/version'
require 'hornetq/server'
require 'hornetq/client'
require 'hornetq/uri'
require 'hornetq/common/logging'
