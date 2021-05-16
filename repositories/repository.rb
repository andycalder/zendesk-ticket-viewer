require 'net/http'
require 'json'

require_relative '../models/ticket'

class Repository
  def initialize(subdomain, email, password)
    @subdomain = subdomain
    @email = email
    @password = password

    url = URI("https://#{@subdomain}.zendesk.com/api/v2/tickets.json?page[size]=25")
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
    request = Net::HTTP::Get.new(url)
    request.basic_auth(@email, @password)

    response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
      http.request(request)
    end

    page = JSON.parse(response.body, { symbolize_names: true })

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
