class ApplicationController < ActionController::Base
  before_action :set_default_title

  private

  def set_default_title
    @title ||= "Connor Forsyth"
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
end
