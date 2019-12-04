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
      redirect_to @character_type, notice: 'Character type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @character_type.update(character_type_params)
      redirect_to @character_type, notice: 'Character type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @character_type.destroy

    redirect_to character_types_url, notice: 'Character type was successfully destroyed.'
  end

  private

    def set_character_type
      @character_type = current_user.character_types.find_by(id: params[:id])
      redirect_to(character_types_url, notice: 'Character type was not found.') if @character_type.nil?
    end

    def character_type_params
      params.require(:character_type).permit(:user_id, :name, :avatar, character_attributes_attributes: [:id, :name, :value, :icon])
    end

    def new_character_type
      current_user.character_types.new(character_type_params)
    end

    def get_my_character_types
      current_user.character_types
    end

end
