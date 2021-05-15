require 'open-uri'
require 'base64'
require 'json'

require_relative '../models/ticket'

class Repository
  def initialize(subdomain, email, password)
    @subdomain = subdomain
    @email = email
    @password = password

    enc = Base64.encode64("#{@email}:#{@password}")
    @headers = { 'Authorization' => "Basic #{enc}" }

    url = "https://#{@subdomain}.zendesk.com/api/v2/tickets.json?page[size]=25"
    add_tickets(load_page(url))
  end

  def all
    @tickets
  end

  def find(id)
    @tickets[id]
  end

  def load_prev_page
    add_tickets(load_page(@prev_url))
  end

  def load_next_page
    add_tickets(load_page(@next_url))
  end

  private

  def load_page(url)
    json = URI.open(url, @headers).read
    page = JSON.parse(json, { symbolize_names: true })

    @prev_url = page[:links][:prev]
    @next_url = page[:links][:next]
    @has_more = page[:meta][:has_more]

    page[:tickets]
  end

  def add_tickets(arr)
    @tickets = {}

    arr.each do |ticket_hash|
      ticket = Ticket.new(ticket_hash)
      @tickets[ticket.id] = ticket
    end
  end
end
