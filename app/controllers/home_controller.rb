class HomeController < ApplicationController
  def index
    @title = "Connor Forsyth"
    render 'index'
  end
end
