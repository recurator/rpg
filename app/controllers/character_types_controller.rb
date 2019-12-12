class CharacterTypesController < ApplicationController
  before_action :set_character_type, only: [:show, :edit, :update, :destroy]

  def show; end
  def edit; end

  def index
    @character_types = get_my_character_types
  end

  def new
    @character_type = get_my_character_types.new
    @character_type.character_attributes.new
  end

  def create
    @character_type = new_character_type

    if @character_type.save
      render_show
    else
      render :new
    end
  end

  def update
    if @character_type.update(character_type_params)
      render_show(:update)
    else
      render :edit
    end
  end

  def destroy
    @character_type.destroy

    respond_to do |format|
      format.html { redirect_to character_types_url, notice: 'Character type was successfully destroyed.'}
      format.js { @character_types = get_my_character_types }
    end
  end

  private

    def render_show(method = :create)
        flash[:notice] = "Character type was successfully #{method}d."
        flash.keep(:notice)
        render js: "window.location = '#{character_type_path(@character_type)}'"
    end

    def set_character_type
      @character_type = current_user.character_types.find_by(id: params[:id])
      redirect_to(character_types_url, notice: 'Character type was not found.') if @character_type.nil?
    end

    def character_type_params
      params.require(:character_type).permit(:user_id, :name, :avatar, character_attributes_attributes: [:id, :name, :value, :icon, :_destroy])
    end

    def new_character_type
      current_user.character_types.new(character_type_params)
    end

    def get_my_character_types
      current_user.character_types.page params[:page]
    end

end
