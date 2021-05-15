class Router
  def initialize(controller, view)
    @controller = controller
    @view = view
    @running = true
  end

  def run
    while @running
      @controller.view_list
      display_actions
      input = @view.ask_user_for('Enter option:')
      route_action(input)
    end
  end

  def display_actions
    puts ''
    puts 'Enter 1 for ticket details'
    puts 'Enter 2 for previous page'
    puts 'Enter 3 for next page'
    puts 'Enter 4 to quit'
  end

  def route_action(action)
    case action
    when '1' then @controller.view_details
    when '2' then @controller.view_prev_page
    when '3' then @controller.view_next_page
    when '4' then @running = false
    else puts 'Invalid input.'
    end
  end
end
