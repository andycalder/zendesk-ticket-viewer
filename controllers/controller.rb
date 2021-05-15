require_relative '../views/view'

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def first_page
    tickets = @repository.first_page
    @view.list_tickets(tickets)
  end

  def prev_page
    tickets = @repository.prev_page
    @view.list_tickets(tickets)
  end

  def next_page
    tickets = @repository.next_page
    @view.list_tickets(tickets)
  end

  def prompt_action
    @view.ask_user_for('')
  end
end
