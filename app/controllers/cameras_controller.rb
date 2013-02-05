class CamerasController < ApplicationController
  before_filter :find_camera, :only => [:show, :edit, :update, :destroy]

  def index
    @cameras = Camera.all
  end

  def new
    @camera = Camera.new
  end

  def create
     @camera = Camera.new(params[:camera])

     if @camera.save
       redirect_to cameras_url, notice: t('camera.create.ok')
     else
       render :action => "new"
     end
   end

   def edit
   end

   def show
   end

   def update
     if @camera.update_attributes(params[:camera])
       redirect_to cameras_url, notice: t('camera.update.ok')
     else
       render :action => "edit"
     end
   end

   def destroy
     @camera.destroy

     redirect_to cameras_url, notice: t('camera.delete.ok')
   end


  private

  def find_camera
    @camera = Camera.find(params[:id])
  end
end
