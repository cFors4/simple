class ApplicationController < ActionController::Base
  before_action :set_default_title

  private

  def set_default_title
    @title ||= "Connor Forsyth"
  end
end
