require 'date'

class View
  def ask_user_for(input)
    puts input
    print '> '
    gets.chomp
  end

  def display_list(tickets)
    puts `clear`
    print_row(%w[Id Status Subject Requester Created Updated])
    print_row(%w[- - - - - -])

    tickets.each_value do |t|
      print_row([t.id, t.status, t.subject, t.requester_id, format_date(t.created_at), format_date(t.updated_at)])
    end
  end

  def display_details(ticket)
    puts `clear`
    puts "Id:          #{ticket.id}"
    puts "Status:      #{ticket.status}"
    puts "Subject:     #{ticket.subject}"
    puts "Requester:   #{ticket.requester_id}"
    puts "Created:     #{ticket.created_at}"
    puts "Updated:     #{ticket.updated_at}"
    puts "Description: #{ticket.description}"
  end

  private

  def print_row(row)
    col_widths = [4, 8, 40, 10, 10, 10]
    row.map!.with_index do |data, index|
      truncate(data, col_widths[index])
    end

    puts row.join(' ')
  end

  def truncate(str, length)
    str.to_s[0...length].ljust(length, ' ')
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end
end
