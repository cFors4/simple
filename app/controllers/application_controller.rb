class ApplicationController < ActionController::Base
  before_action :set_default_title

  def search
    query = params[:q]
    results = []

    if query.present? && query.length >= 3
      # Implement your search logic here
      # This is a simple example, you might want to use a more sophisticated search solution
      results = search_content(query)
    end

    render json: results
  end

  private

  def set_default_title
    @title ||= "Connor Forsyth"
  end

  def search_content(query)
    # This is a placeholder implementation
    # You should replace this with actual logic to search through your content
    [
      { page: "Home", content: "Sample result 1 containing #{query}", url: "/" },
      { page: "About", content: "Sample result 2 containing #{query}", url: "/about" },
      # Add more sample results or implement actual search logic
    ]
  end
end
