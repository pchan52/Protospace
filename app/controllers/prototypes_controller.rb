class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show, :edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @main_content = @prototype.prototype_images.build
    @sub_contents = 2.times { @prototype.prototype_images.build }
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to :root
    else
      redirect_to new_prototype_url
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
    @main_content = @prototype.prototype_images.first
    @sub_contents = @prototype.prototype_images.sub
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
       redirect_to action: 'show'
    else
       render action: 'edit'
    end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:name, :concept, :catch_copy, :user_id, prototype_images_attributes: [:id, :image, :status])
  end

end
