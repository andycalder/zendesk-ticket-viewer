require_relative '../views/view'
require_relative '../models/page'

class PagesController
  def initialize(sessions_controller)
    @sessions_controller = sessions_controller
    @view = View.new
    load_first_page
  end

  def view_next_page
    load_next_page
    view_list
  end

  def view_list
    tickets = @page.all
    @view.display_list(tickets)
  end

  def view_details
    id = @view.ask_user_for('Enter ticket id:').to_i
    ticket = @page.find(id)

    if ticket
      @view.display_details(ticket)
      @view.ask_user_for('Press enter to go back.')
    else
      puts 'Invalid id.'
      view_details
    end
  end

  private

  def load_first_page
    @page = Page.new(@sessions_controller.authenticate)
  end

  def load_next_page
    next_url = @page.next_url
    @page = Page.new(@sessions_controller.load_json(next_url))
  end
end
