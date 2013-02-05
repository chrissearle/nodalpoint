class CamerasController < AuthenticatedController
  before_filter :find_camera, :only => [:show, :edit, :update, :destroy]

  def index
    @cameras = current_user.cameras.ordered
  end

  def new
    @camera = Camera.new
    @camera.user = current_user
  end

  def create
     @camera = Camera.new(params[:camera])
     @camera.user = current_user

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
    @camera = current_user.cameras.find(params[:id])
  end
end
