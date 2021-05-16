require_relative 'views/view'
require_relative 'controllers/pages_controller'
require_relative 'controllers/sessions_controller'
require_relative 'router'

view = View.new

sessions_controller = SessionsController.new
pages_controller = PagesController.new(sessions_controller)
router = Router.new(pages_controller, view)
router.run
