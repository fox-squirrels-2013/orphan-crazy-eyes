class SubscriptionsController <ApplicationController

  def new
    user = current_user
    @subscription = Subscription.new
  end

  def create
    user = current_user
    @subscription = Subscription.create params[:subscription]
    @user = User.find(current_user.id)
    @user.update_attributes(:subscription_id => @subscription.id)
    redirect_to instagram_path(current_user)
  end

end


# @user.subscription_id => @subscription.id