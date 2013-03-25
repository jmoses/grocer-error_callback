module Grocer::ErrorCallback::Callbacks
  module ClassMethods
    @@callbacks = {
      connection_error: []
    }

    @@callbacks.keys.each do |callback|
      define_method("on_#{callback}") do |&block|
        @@callbacks[callback] << block
      end
    end

    def run_callbacks(callback, *args)
      @@callbacks[callback].each do |callback|
        callback[*args]
      end
    end
  end

  module InstanceMethods
    def run_callbacks(callback, *args)
      Grocer.run_callbacks callback, *args
    end
  end
end
