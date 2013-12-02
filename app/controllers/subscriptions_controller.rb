class SubscriptionsController <ApplicationController

  def new
    user = current_user
    @subscription = Subscription.new
  end

  def create
    user = current_user
    @subscription = Subscription.create params[:subscription]
    redirect_to instagram_path(current_user)
  end

end
