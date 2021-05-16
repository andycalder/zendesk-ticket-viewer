require_relative 'ticket'

class Page
  attr_reader :next_url

  def initialize(page_hash)
    @tickets = {}
    create_tickets(page_hash[:tickets])

    @has_next_page = page_hash[:meta][:has_more]
    @next_url = page_hash[:links][:next]
  end

  def create_tickets(arr)
    arr.each do |ticket_hash|
      ticket = Ticket.new(ticket_hash)
      @tickets[ticket.id] = ticket
    end
  end

  def all
    @tickets
  end

  def find(id)
    @tickets[id]
  end

  def next_page?
    @has_next_page
  end
end
