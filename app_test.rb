ENV['RACK_ENV'] = 'test'

require './app'
require 'test/unit'
require 'rack/test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/hello'
    assert last_response.ok?
    assert_equal 'world', last_response.body
  end
end
