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
    json = Session.load_json(url, @email, @password)
    if json
      json
    else
      puts 'HTTP error. Please try again.'
      authenticate
    end
  end
end
