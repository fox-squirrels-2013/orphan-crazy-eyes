namespace :db do
  desc "miya and vanessa make a rake task"

  task :monthly_check => :environment do
    if Date.now ==
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
      users_votes = Vote.where(user_id: num) #user_votes = array of vote objects that user 1 voted on
      users_votes.each do |vote|
        img_id = vote.image_id #img_id = the id of a single vote object
        array_of_image_objects_user_wants_to_print << Image.where(id: img_id) #
      end
      array_of_image_objects_user_wants_to_print
      images_per_user = array_of_image_objects_user_wants_to_print - array_of_image_objects_not_to_print
      Print.create(p_user_id: num, p_image_urls: images_per_user)
    end
  end

end