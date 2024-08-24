class HomeController < ApplicationController
  def index
    @title = "MinMaxFlow"
    render 'index'
  end
end
