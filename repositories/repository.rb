require 'open-uri'
require 'base64'
require 'json'

require_relative '../models/ticket'

class Repository
  def initialize(subdomain, email, password)
    @subdomain = subdomain
    @email = email
    @password = password
  end

  def fetch_tickets
    enc = Base64.encode64("#{@email}:#{@password}")
    url = "https://#{@subdomain}.zendesk.com/api/v2/tickets.json"
    headers = { 'Authorization' => "Basic #{enc}" }
    json = URI.open(url, headers).read

    JSON.parse(json, { symbolize_names: true })[:tickets]
  end
end

# Minimal test code
puts 'Zendesk subdomain:'
print '> '
subdomain = gets.chomp

puts 'Email:'
print '> '
email = gets.chomp

puts 'Password:'
print '> '
password = gets.chomp

test_repo = Repository.new(subdomain, email, password)

tickets = []
test_repo.fetch_tickets.each do |ticket_hash|
  tickets << Ticket.new(ticket_hash)
end

pp tickets
