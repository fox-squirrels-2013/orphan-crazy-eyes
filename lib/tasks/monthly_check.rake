require 'open-uri'

namespace :db do
  desc "miya and vanessa make a rake task"
  task :monthly_check => :environment do


    # if Date.today.day == 1
      images = Image.all
      users = User.all
      votes = Vote.all
      total_users = users.length + 1

      array_of_image_objects_not_to_print = []

      images.each do |row|
        if row.vote_count < 1
          array_of_image_objects_not_to_print << row
        end
        array_of_image_objects_not_to_print
      end

      total_users.times do |num|
        array_of_image_objects_user_wants_to_print = []
        users_votes = Vote.where(user_id: num)
        users_votes.each do |vote|
          img_id = vote.image_id
          array_of_image_objects_user_wants_to_print << Image.where(id: img_id).first
        end
        array_of_image_objects_user_wants_to_print
        image_objects_per_user = array_of_image_objects_user_wants_to_print - array_of_image_objects_not_to_print
        pdf_image_urls = []
        image_objects_per_user.each do |image_object|

          Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|
            pdf.image open(image_object.image_url)
            pdf.render_file('#{image_object.instagram_id}.pdf')
            newpdf = File.open('#{image_object.instagram_id}.pdf')
            cloudpdf = Cloudinary::Uploader.upload(newpdf)
            img = Image.where(id: image_object.id).first
            img.update_attributes(pdf_image_url: cloudpdf)
            pdf_image_urls << img.pdf_image_url
          end
        end
        Print.create(p_user_id: num, p_image_urls: pdf_image_urls)
      end

    # end
  end
end