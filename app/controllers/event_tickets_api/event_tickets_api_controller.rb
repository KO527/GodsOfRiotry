class EventTicketsApiController < ApplicationController
  def create
  	@search_item = params[:looking_for] || {}
  	@events = Event_tickets_api.for(@search_item)
  end

  def update

  end

  def destroy

  end

  private

  	params.require(:event_tickets_api).permit(:looking_for)
end
