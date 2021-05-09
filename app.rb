require_relative 'views/view'
require_relative 'repositories/repository'
require_relative 'controllers/controller'

view = View.new

subdomain = view.ask_user_for('Zendesk subdomain:')
email = view.ask_user_for('Email:')
password = view.ask_user_for('Password:')

repository = Repository.new(subdomain, email, password)
controller = Controller.new(repository)

controller.list_tickets
