class View
  def ask_user_for(input)
    puts input
    print '> '
    gets.chomp
  end

  def list_all_tickets(tickets)
    tickets.each do |ticket|
      puts "#{ticket.status} #{ticket.subject} #{ticket.requester_id} #{ticket.created_at}"
    end
  end
end
