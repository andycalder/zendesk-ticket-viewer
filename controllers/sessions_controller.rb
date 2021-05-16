require 'net/http'
require 'json'

require_relative '../models/session'
require_relative '../views/view'

class SessionsController
  def initialize
    @view = View.new
  end

  def authenticate
    @subdomain = @view.ask_user_for('Zendesk subdomain:')
    @email = @view.ask_user_for('Email:')
    @password = @view.ask_user_for('Password:')

    url = "https://#{@subdomain}.zendesk.com/api/v2/tickets.json?page[size]=25"
    load_json(url)
  end

  def load_json(url)
    Session.load_json(url, @email, @password) do |status, body|
      case status
      when '200'
        JSON.parse(body, { symbolize_names: true })
      when '401'
        puts 'Invalid credentials. Please try again.'
        authenticate
      else
        puts "HTTP error #{status}. Please try again."
        authenticate
      end
    end
  end
end
