module Lob

  @lob = Lob()

  def lob_address(user_id)
    subscription = Subscription.where(user_id: user_id).first
    @lob.addresses.create(
      name: subscription.full_name,
      address_line1: subscription.address_line1,
      address_line2: subscription.address_line2,
      city: subscription.city,
      state: subscription.state,
      country: subscription.country,
      zip: subscription.zip
    )
  end

  # not currently accepting jpegs :(((((
  def lob_object(pdf_image_url)
    image = Image.where(pdf_image_url: pdf_image_url).first
    @lob.objects.create(
      name: image.instagram_id,
      file: image.image_url,
      setting_id: "500" # 4x6 color Gloss Photo
    )
  end

  def users_lob_objects(user_id)
    prints = Print.where(p_user_id: user_id)
    lob_objects = []
    prints.p_image_urls.each do |img_url|
      lob_ojects << lob_object img_url
    end
    objects = []
    lob_ojects.each do |obj|
      objects << obj[id]
    end
  end

  def lob_job(user_id, lob_address, objects)
    @lob.jobs.create(
      name: user_id + Date.today,
      to: lob_address[id],
      objects: objects
    )
  end

end

