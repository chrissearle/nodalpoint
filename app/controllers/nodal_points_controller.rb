class NodalPointsController < ApplicationController
  before_filter :find_nodal_point, :only => [:show, :edit, :update, :destroy]

  def index
    @nodal_points = NodalPoint.preloaded
  end

  def new
    @nodal_point = NodalPoint.new
  end

  def create
     @nodal_point = NodalPoint.new(params[:nodal_point])

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
    @nodal_point = NodalPoint.find(params[:id])
  end
end
