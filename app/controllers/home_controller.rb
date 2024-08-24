class HomeController < ApplicationController
  def index
    @title = "Home"
    render 'index'
  end
end
