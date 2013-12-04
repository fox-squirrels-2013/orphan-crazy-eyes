require 'open-uri'

namespace :db do
  desc "miya and vanessa make a rake task"
  task :monthly_check => :environment do


    images = Image.all
    users = User.all
    votes = Vote.all
    total_users = users.length

    array_of_image_objects_not_to_print = []

    images.each do |row|
      if row.vote_count < 1
        array_of_image_objects_not_to_print << row
      end
        array_of_image_objects_not_to_print # don't need this either
      end
      total_users.times do |num|
        num += 1
        array_of_image_objects_user_wants_to_print = []
        users_votes = Vote.where(user_id: num)
        users_votes.each do |vote|
          img_id = vote.image_id
          array_of_image_objects_user_wants_to_print << Image.where(id: img_id).first
        end
        array_of_image_objects_user_wants_to_print # don't need
        image_objects_per_user = array_of_image_objects_user_wants_to_print - array_of_image_objects_not_to_print
        pdf_image_urls = []
        image_objects_per_user.each do |image_object|
          Prawn::Document.generate(:template => "#{Rails.root.to_s}/public/whiteBG.jpg") do |pdf|
            pdf.image open(image_object.image_url)
            pdf.render_file('#{image_object.instagram_id}.pdf')
            newpdf = File.open('#{image_object.instagram_id}.pdf')
            cloudpdf = Cloudinary::Uploader.upload(newpdf)
            image_object.update_attributes(pdf_image_url: cloudpdf["url"])
            pdf_image_urls << image_object.pdf_image_url
          end

        end

        print_job = Print.create(p_user_id: num, p_image_urls: pdf_image_urls)
        @lob = Lob()
        subscription = Subscription.where(user_id: 1).first
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
            # file: "http://res.cloudinary.com/dvm/image/upload/v1386101795/v9cg3aezfdjywlbw21ox.pdf",
            # file: image_object.pdf_image_url,
            file: "#{Rails.root.to_s}/public/test_311GENjpg.pdf",
            setting_id: "500"
            )
        end

        array_of_lob_object_ids = lob_objects.map { |obj| obj["id"] }

        @lob.jobs.create(
          name: "bah69",
          to: @lob_address["id"],
          objects: array_of_lob_object_ids
          )
      end


  end
end