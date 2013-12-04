require 'open-uri'

namespace :db do
  desc "the best 75 lines of code ever written"
  task :monthly_check => :environment do

    if Date.today.day == 1
      images = Image.all
      users = User.all
      votes = Vote.all
      total_users = users.length

      array_of_image_objects_not_to_print = []

      images.each do |row|
        if row.vote_count < 1
          array_of_image_objects_not_to_print << row
        end
      end
      total_users.times do |num|
        num += 1
        array_of_image_objects_user_wants_to_print = []
        users_votes = Vote.where(user_id: num)
        users_votes.each do |vote|
          img_id = vote.image_id
          array_of_image_objects_user_wants_to_print << Image.where(id: img_id).first
        end
        image_objects_per_user = array_of_image_objects_user_wants_to_print - array_of_image_objects_not_to_print
        pdf_image_urls = []
        image_objects_per_user.each do |image_object|
          Prawn::Document.generate('#{image_object.instagram_id}.pdf', skip_page_creation: true, :page_size => [288, 432]) do |pdf|
            pdf.transparent(1) do
              pdf.start_new_page(:background_color => "234575")
              pdf.image open(image_object.image_url), :fit => [220,220], :position => :center
            end
            newpdf = File.open('#{image_object.instagram_id}.pdf')
            cloudpdf = Cloudinary::Uploader.upload(newpdf)
            image_object.update_attributes(pdf_image_url: cloudpdf["url"])
            pdf_image_urls << image_object.pdf_image_url
          end
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

        lob_objects = image_objects_per_user.map do |image_object|
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
end