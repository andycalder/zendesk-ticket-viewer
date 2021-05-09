require 'open-uri'
require 'base64'
require 'json'

require_relative '../models/ticket'

class Repository
  def initialize(subdomain, email, password)
    @subdomain = subdomain
    @email = email
    @password = password
    @tickets = []
    add_tickets
  end

  def all
    @tickets
  end

  def fetch_tickets
    enc = Base64.encode64("#{@email}:#{@password}")
    url = "https://#{@subdomain}.zendesk.com/api/v2/tickets.json"
    headers = { 'Authorization' => "Basic #{enc}" }
    json = URI.open(url, headers).read

    JSON.parse(json, { symbolize_names: true })[:tickets]
  end

  def add_tickets
    fetch_tickets.each do |ticket_hash|
      @tickets << Ticket.new(ticket_hash)
    end
  end
end
