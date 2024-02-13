
class EventCreator
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    create_event
  end

  private

  def create_event
    Iterable::CreateUser.new(params).call
    EventNotifier.new(params).call if params[:event_type] == 'B'
  end
end
