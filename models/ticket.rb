require 'date'

class Ticket
  attr_reader :status, :subject, :requester_id, :created_at, :updated_at

  def initialize(attributes)
    @status = attributes[:status]
    @subject = attributes[:subject]
    @requester_id = attributes[:requester_id]
    @created_at = parse_date(attributes[:created_at])
    @updated_at = parse_date(attributes[:updated_at])
  end

  def parse_date(str)
    Date.parse(str)
  end
end
