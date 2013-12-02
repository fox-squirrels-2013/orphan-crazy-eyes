namespace :db do
  desc "miya and vanessa make a rake task"
  task :monthly_check => :environment do


    if Date.today.day == 1
      debugger
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
          pdf_image_urls << image_object.pdf_image_url
        end
        Print.create(p_user_id: num, p_image_urls: pdf_image_urls)
      end

    end


  end
end