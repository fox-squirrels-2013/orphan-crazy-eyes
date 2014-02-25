class ApplicationController < ActionController::Base
  protect_from_forgery
  include InstagramOauth
  include Authentication

  def pagination page
    all_tagged = []
    all_tagged << page
    max = page.pagination["next_max_tag_id"]
    unless max.nil?
      twenty_pix = client.tag_recent_media('printstacard', {max_id: max})
      all_tagged << twenty_pix
      pagination twenty_pix
    end
    all_tagged
  end

  def populate_image_db
    # @old = client.tag_recent_media 'printstacard'
    all = pagination client.tag_recent_media('printstacard')
    @all_tagged = all.flatten

    @instagram_array = []
    @all_tagged.each do |tag|
      if Image.where(instagram_id: tag.id).exists?
        @image = Image.where(instagram_id: tag.id).first
        @instagram_array << @image
      else
        @image = Image.create :instagram_id => tag.id,
                                :image_url => tag.images.standard_resolution.url
        @instagram_array << @image
      end
    end
    @instagram_array
  end

  def vote!
    @user = current_user
    if Image.where(instagram_id: params["instagram_id"]).exists?
      @image = Image.where(instagram_id: params["instagram_id"]).first
    else
      @image = Image.create :instagram_id => params["instagram_id"],
                            :image_url => params["image_url"]
    end
    @vote = Vote.create :user_id => @user.id,
                        :image_id => @image.id
    @count = Vote.where(:image_id => @vote.image_id).count
    @image.update_attributes :vote_count => @count
    @new_count = @image.vote_count
  end

  helper_method :current_user
end
