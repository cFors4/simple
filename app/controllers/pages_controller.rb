class PagesController < ApplicationController
  layout 'application'
  
  def flow
    @title = "Flow"
    render layout: 'application', html: { class: 'documentation-page' }
  end

  def engineer
    @title = "Engineer"
    render layout: 'application', html: { class: 'documentation-page' }
  end

  def become
    @title = "Become"
    render layout: 'application', html: { class: 'documentation-page' }
  end

  def be
    @title = "Be"
    render layout: 'application', html: { class: 'documentation-page' }
  end
end
