class NodalPointsController < AuthenticatedController
  before_filter :find_nodal_point, :only => [:show, :edit, :update, :destroy]

  def index
    @nodal_points = current_user.nodal_points.ordered
  end

  def new
    @nodal_point = NodalPoint.new
    @nodal_point.user = current_user
  end

  def create
     @nodal_point = NodalPoint.new(params[:nodal_point])
     @nodal_point.user = current_user

     if @nodal_point.save
       redirect_to nodal_points_url, notice: t('nodal_point.create.ok')
     else
       render :action => "new"
     end
   end

   def edit
   end

   def show
   end

   def update
     if @nodal_point.update_attributes(params[:nodal_point])
       redirect_to nodal_points_url, notice: t('nodal_point.update.ok')
     else
       render :action => "edit"
     end
   end

   def destroy
     @nodal_point.destroy

     redirect_to nodal_points_url, notice: t('nodal_point.delete.ok')
   end


  private

  def find_nodal_point
    @nodal_point = current_user.nodal_points.find(params[:id])
  end
end
