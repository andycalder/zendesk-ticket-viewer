class Router
  def initialize(pages_controller, view)
    @pages_controller = pages_controller
    @view = view
    @running = true
  end

  def run
    while @running
      @pages_controller.view_list
      display_actions
      input = @view.ask_user_for('Enter option:')
      route_action(input)
    end
  end

  def display_actions
    puts ''
    puts 'Enter 1 for ticket details'
    puts 'Enter 2 for next page'
    puts 'Enter 3 to quit'
  end

  def route_action(action)
    case action
    when '1' then @pages_controller.view_details
    when '2' then @pages_controller.view_next_page
    when '3' then @running = false
    else puts 'Invalid input.'
    end
  end
end
