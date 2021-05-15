require_relative '../views/view'

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def view_prev_page
    @repository.load_prev_page
    view_list
  end

  def view_next_page
    @repository.load_next_page
    view_list
  end

  def view_list
    tickets = @repository.all
    @view.display_list(tickets)
  end

  def view_details
    id = @view.ask_user_for('Enter ticket id:').to_i
    ticket = @repository.find(id)

    if ticket
      @view.display_details(ticket)
      @view.ask_user_for('Press enter to go back.')
    else
      puts 'Invalid id.'
      view_details
    end
  end
end
