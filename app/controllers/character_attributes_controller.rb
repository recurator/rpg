class CharacterAttributesController < ApplicationController
  before_action :set_character_attribute, only: [:destroy, :edit, :update]
  before_action :set_character_type, only: [:new, :create, :edit]

  def edit; end

  def new
    @character_attribute = @character_type.character_attributes.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @character_attribute = new_character_attribute

    if @character_attribute.save
      redirect_to character_types_url, notice: "Character attribute for #{@character_type.name} was successfully created."
    else
      render :validationerrors
    end
  end

  def update
    if @character_attribute.update(character_attribute_params)
      redirect_to character_types_url, notice: "Character attribute was successfully updated."
    else
      render :validationerrors
    end
  end

  def destroy
    @character_attribute.destroy

    respond_to do |format|
      flash.now[:notice] = 'Character attribute was successfully destroyed.'
      format.js { @character_attribute_id }
    end
  end

  private

  def character_attribute_params
    params.require(:character_attribute).permit(:character_type, :icon, :name, :value)
  end

  def new_character_attribute
    @character_type.character_attributes.new(character_attribute_params)
  end

  def set_character_attribute
    @character_attribute_id = params[:id]
    @character_attribute    = current_user.character_attributes.find_by(id: @character_attribute_id)
    render( :nothing, notice: 'Character attribute was not found.') if @character_attribute.nil?
  end

  def set_character_type
    @character_type = current_user.character_types.find_by(id: params[:character_type_id])
    render( nothing: true) if @character_type.nil?
  end

end
