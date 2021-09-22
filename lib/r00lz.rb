# frozen_string_literal: true

require_relative "r00lz/version"

module R00lz
  def self.to_underscore(s)
    s.gsub(/([A-Z+])([A-Z][a-z])/,'\1_\2')
     .gsub(/([a-z\d])([A-Z])/,'\1_\2')
     .downcase
  end

  # This is how Rails originally "knows" how
  # to "find" controllers in the app
  class Object
    def self.const_missing(c)
      require R00lz.to_underscore(c.to_s)
      Object.const_get(c)
    end
  end

  class Error < StandardError; end

  class App
    def call(env)
      kl, act = cont_and_act(env)
      text = kl.new(env).send(act)
      [200,
       {'Content-type' => 'text/html'},
       [text]
      ]
    end

    private

    def cont_and_act(env)
      _, con, act, after = env["PATH_INFO"].split('/')
      puts env["PATH_INFO"]
      con = con.capitalize + "Controller"
      [Object.const_get(con), act]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
