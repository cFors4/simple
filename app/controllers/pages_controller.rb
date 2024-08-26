class PagesController < ApplicationController
  layout 'application'
  
  before_action :set_page_class

  def flow
    @title = "Flow"
  end

  def engineer
    @title = "Engineer"
  end

  def become
    @title = "Become"
  end

  def be
    @title = "Be"
  end

  private

  def set_page_class
    @page_class = 'documentation-page'
  end
end
