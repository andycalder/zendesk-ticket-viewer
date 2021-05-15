require 'date'

class Ticket
  attr_reader :id, :status, :subject, :requester_id, :created_at, :updated_at, :description

  def initialize(attrs)
    @id = attrs[:id]
    @status = attrs[:status]
    @subject = attrs[:subject]
    @requester_id = attrs[:requester_id]
    @created_at = parse_date(attrs[:created_at])
    @updated_at = parse_date(attrs[:updated_at])
    @description = attrs[:description]
  end

  private

  def parse_date(str)
    Date.parse(str)
  end
end
