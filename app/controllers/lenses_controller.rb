class LensesController < AuthenticatedController
  before_filter :find_lens, :only => [:show, :edit, :update, :destroy]

  def index
    @lenses = current_user.lenses.ordered
  end

  def new
    @lens = Lens.new
    @lens.user = current_user
  end

  def create
     @lens = Lens.new(params[:lens])
     @lens.user = current_user

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
    @lens = current_user.lenses.find(params[:id])
  end
end
