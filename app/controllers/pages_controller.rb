class PagesController < ApplicationController
  layout "application"

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

  def tools_and_setups
    @title = "Tools and Setups"
  end

  def dashboard
    @title = "MinMax Dashboard"
  end

  def self_sufficiency
    @title = "Self-Sufficiency via Open Source"
  end

  def personal_tech_stack
    @title = "Personal Tech Stack"
  end

  def saas_apps_stack
    @title = "SaaS/Apps Stack"
  end

  def enterprise_engineering_stack
    @title = "Enterprise Engineering Stack"
  end

  def habit_stack
    @title = "Habit Stack"
  end

  def book_stack
    @title = "Book Stack"
  end

  def hub_stack
    @title = "Hub Stack"
  end

  def skill_stack
    @title = "Skill Stack"
  end

  def perspective_stack
    @title = "Perspective Stack"
  end

  def consumption_stack
    @title = "Consumption Stack"
  end

  def growth_stack
    @title = "Growth Stack"
  end

  def future_stack
    @title = "Future Stack"
  end

  def theory_of_everything
    @title = "Theory of Everything"
  end

  def homo_memetic_techno_capital
    @title = "Homo-Memetic-Techno-Capital"
  end

  def skillful
    @title = "Skillful"
  end

  def purpose_programming
    @title = "Purpose/Programming"
  end

  def individual_configurability
    @title = "Individual Configurability"
  end

  private

  def set_page_class
    @page_class = "documentation-page"
  end
end
