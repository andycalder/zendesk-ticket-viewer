require_relative '../views/view'

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list_tickets
    @view.list_all_tickets(@repository.all)
  end
end
