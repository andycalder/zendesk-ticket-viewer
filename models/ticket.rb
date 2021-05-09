class Ticket
  attr_reader :status, :subject, :requester_id, :created_at, :updated_at

  def initialize(attributes)
    @status = attributes[:status]
    @subject = attributes[:subject]
    @requester_id = attributes[:requester_id]
    @created_at = attributes[:created_at]
    @updated_at = attributes[:updated_at]
  end
end
