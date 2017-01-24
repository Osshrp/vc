require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  protect_from_forgery with: :exception

  layout proc {
    if request.xhr?
      false
    else
      "application"
    end
  }
end
