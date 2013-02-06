class UsersController < AuthenticatedController
  def edit
  end

  def update
    @current_user.email = params[:user][:email]

    if @current_user.save
      redirect_to login_path, notice: t('flash.users.update.ok')
    else
      render :action => :edit
    end
  end

  def users_brands
    render :json => (current_user.cameras.map(&:brand) + current_user.lenses.map(&:brand)).select{ |b| b.downcase.starts_with? params[:prefix].downcase }.uniq.sort
  end

end
