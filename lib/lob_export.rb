require 'open-uri'

module LobExport

  images = Image.all
  users = User.all
  votes = Vote.all
  total_users = users.length

  dont_print = []

  images.each do |row|
    if row.vote_count < 1
      dont_print << row
    end
  end

  total_users.times do |num|
    num += 1
    user = User.find(num)
    if user.subscription_id != nil
      pics_user_voted_for = []
      users_votes = Vote.where(user_id: num)
      users_votes.each do |vote|
        img_id = vote.image_id
        pics_user_voted_for << Image.where(id: img_id).first
      end
      users_pics = pics_user_voted_for - dont_print
      pdf_image_urls = []
      users_pics.each do |image_object|
        Prawn::Document.generate('#{image_object.instagram_id}.pdf', skip_page_creation: true, :page_size => [288, 432]) do
          start_new_page
          image open(image_object.image_url), :fit => [220,220]
        end
        newpdf = File.open('#{image_object.instagram_id}.pdf')
        cloudpdf = Cloudinary::Uploader.upload(newpdf)
        image_object.update_attributes(pdf_image_url: cloudpdf["url"])
        pdf_image_urls << image_object.pdf_image_url
      end

      print_job = Print.create(p_user_id: num, p_image_urls: pdf_image_urls)
      @lob = Lob()
      subscription = Subscription.where(user_id: num).first
      @lob_address = @lob.addresses.create(
        name: subscription.first_name,
        address_line1: subscription.address_line1,
        address_line2: subscription.address_line2,
        city: subscription.city,
        state: subscription.state,
        country: subscription.country,
        zip: subscription.zip
        )

      lob_objects = users_pics.map do |image_object|
        @lob.objects.create(
          name: image_object.instagram_id,
          file: image_object.pdf_image_url,
          setting_id: "500"
          )
      end

      array_of_lob_object_ids = lob_objects.map { |obj| obj["id"] }

      @lob.jobs.create(
        name: "#{num}" + Date.new.to_s,
        to: @lob_address["id"],
        objects: array_of_lob_object_ids
        )
    end
  end
end