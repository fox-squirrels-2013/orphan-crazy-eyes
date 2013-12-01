#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

OrphanCrazyEyes::Application.load_tasks

# task :monthly_check do

def make_an_array_of_image_objects_to_print_for_one_user
  images = Image.all
  users = User.all
  votes = Vote.all
  total_users = users.length + 1

  array_of_image_objects_not_to_print = []
  array_of_image_objects_user_wants_to_print = []

  images.each do |row|
    if row.vote_count < 1
      array_of_image_objects_not_to_print << row
    end
    array_of_image_objects_not_to_print
  end

  total_users.times do |num|
    users_votes = Vote.where(user_id: num) #user_votes = array of vote objects that user 1 voted on
    users_votes.each do |vote|
      img_id = vote.image_id #img_id = the id of a single vote object
      array_of_image_objects_user_wants_to_print << Image.where(id: img_id) #
    end
    array_of_image_objects_user_wants_to_print
  end

  images_per_user = array_of_image_objects_user_wants_to_print - array_of_image_objects_not_to_print
end

