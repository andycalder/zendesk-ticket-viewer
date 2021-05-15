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
  end

  def first_page
    url = "https://#{@subdomain}.zendesk.com/api/v2/tickets.json?page[size]=25"
    create_tickets(fetch_page(url))
  end

  def prev_page
    create_tickets(fetch_page(@prev_url))
  end

  def next_page
    create_tickets(fetch_page(@next_url))
  end

  private

  def fetch_page(url)
    json = URI.open(url, @headers).read
    page = JSON.parse(json, { symbolize_names: true })

    @prev_url = page[:links][:prev]
    @next_url = page[:links][:next]
    @has_more = page[:meta][:has_more]

    page[:tickets]
  end

  def create_tickets(arr)
    arr.map { |ticket_hash| Ticket.new(ticket_hash) }
  end
end
