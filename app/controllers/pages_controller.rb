class PagesController < ApplicationController
  def index
    @character_types = current_user.character_types.page params[:page]
    render template: "character_types/index.html.erb"
  end
end
