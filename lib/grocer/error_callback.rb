require "grocer/error_callback/version"
require 'grocer/error_callback/callbacks'
require 'grocer/error_callback/connection'
require 'grocer/connection'

module Grocer
  module ErrorCallback
  end
end

Grocer.send :extend, Grocer::ErrorCallback::Callbacks::ClassMethods
Grocer::Connection.send :include, Grocer::ErrorCallback::Callbacks::InstanceMethods
Grocer::Connection.send :include, Grocer::ErrorCallback::Connection
