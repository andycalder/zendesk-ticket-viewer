require 'date'

class View
  def ask_user_for(input)
    puts input
    print '> '
    gets.chomp
  end

  def list_tickets(tickets)
    puts `clear`
    print_row(%w[No Status Subject Requester Created Updated])

    tickets.each_with_index do |ticket, index|
      print_row(
        [
          index,
          ticket.status,
          ticket.subject,
          ticket.requester_id,
          format_date(ticket.created_at),
          format_date(ticket.updated_at)
        ]
      )
    end
  end

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
