class SubscriptionsController <ApplicationController

  def show
    user = current_user
    @subscription = Subscription.create params[:subscription]
    p "fuck"
  end



  def create
    user = current_user
    @subscription = Subscription.create params[:subscription]
    redirect_to instagram_path(current_user)
  end


end
