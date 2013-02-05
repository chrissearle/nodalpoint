class LensesController < ApplicationController
  before_filter :find_lens, :only => [:show, :edit, :update, :destroy]

  def index
    @lenses = Lens.all
  end

  def new
    @lens = Lens.new
  end

  def create
     @lens = Lens.new(params[:lens])

     if @lens.save
       redirect_to lenses_url, notice: t('lens.create.ok')
     else
       render :action => "new"
     end
   end

   def edit
   end

   def show
   end

   def update
     if @lens.update_attributes(params[:lens])
       redirect_to lenses_url, notice: t('lens.update.ok')
     else
       render :action => "edit"
     end
   end

   def destroy
     @lens.destroy

     redirect_to lenses_url, notice: t('lens.delete.ok')
   end


  private

  def find_lens
    @lens = Lens.find(params[:id])
  end
end
