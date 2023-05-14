#!/usr/bin/env ruby
require "soap/rpc/standaloneserver"

begin
   class MyServer < SOAP::RPC::StandaloneServer

      # Expose our services
      def initialize(*args)
         add_method(self, 'add', 'a', 'b')
         add_method(self, 'div', 'a', 'b')
      end

      # Handler methods
      def add(a, b)
         return a + b
      end
      def div(a, b) 
         return a / b 
      end
end
   server = MyServer.new("MyServer", 
            'urn:ruby:calculation', 'localhost', 8080)
   trap('INT'){
      server.shutdown
   }
   server.start
rescue => err
   puts err.message
end
