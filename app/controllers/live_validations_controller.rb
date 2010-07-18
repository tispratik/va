class LiveValidationsController < ApplicationController
  
  skip_before_filter :login_required
  
  def uniqueness
    responder = LiveValidations.current_adapter.validation_responses[:uniqueness]
    render :text => responder.respond(params)
  end
end