class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    @controller.first_page

    while @running
      display_actions
      input = @controller.prompt_action
      route_action(input)

    end
  end

  def display_actions
    puts 'Enter ticket number to view details'
    puts 'Enter p for previous page'
    puts 'Enter n for next page'
    puts 'Enter q to quit'
  end

  def route_action(action)
    case action
    when 'n' then @controller.next_page
    when 'p' then @controller.prev_page
    when 'q' then @running = false
    else puts 'Invalid input.'
    end
  end
end
