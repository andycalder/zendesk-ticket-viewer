require_relative 'controllers/pages_controller'
require_relative 'views/view'

class Router
  def initialize
    @pages_controller = PagesController.new
    @view = View.new
    @running = true
  end

  def run
    while @running
      @pages_controller.display_list
      display_actions
      input = @view.ask_user_for('Enter view option:')
      route_action(input)
    end
  end

  def display_actions
    puts ''
    puts 'Enter 1 for ticket details'
    puts 'Enter 2 for prev page'
    puts 'Enter 3 for next page'
    puts 'Enter 4 to quit'
  end

  def route_action(action)
    case action
    when '1' then @pages_controller.display_details
    when '2' then @pages_controller.load_prev_page
    when '3' then @pages_controller.load_next_page
    when '4' then @running = false
    else puts 'Invalid input.'
    end
  end
end
