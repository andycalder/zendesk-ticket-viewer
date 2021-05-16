require_relative '../views/view'
require_relative '../models/page'
require_relative 'sessions_controller'

class PagesController
  def initialize
    @sessions_controller = SessionsController.new
    @view = View.new
    load_first_page
  end

  def load_first_page
    @page = Page.new(@sessions_controller.authenticate)
  end

  def load_prev_page
    return unless @page.prev_page?

    prev_url = @page.prev_url
    @page = Page.new(@sessions_controller.load_json(prev_url))
  end

  def load_next_page
    return unless @page.next_page?

    next_url = @page.next_url
    @page = Page.new(@sessions_controller.load_json(next_url))
  end

  def display_list
    tickets = @page.all
    @view.display_list(tickets)
  end

  def display_details
    id = @view.ask_user_for('Enter ticket id:').to_i
    ticket = @page.find(id)

    if ticket
      @view.display_details(ticket)
      @view.ask_user_for("\nPress enter to go back.")
    else
      puts 'Invalid id. Please try again.'
      display_details
    end
  end
end
