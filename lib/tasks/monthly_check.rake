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
### beginning of big loop
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
########## PRAWN #############
          Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|
            pdf.image open(image_object.image_url)
            pdf.render_file('#{image_object.instagram_id}.pdf')
            newpdf = File.open('#{image_object.instagram_id}.pdf')
            cloudpdf = Cloudinary::Uploader.upload(newpdf)
            $img = Image.where(id: image_object.id).first
            $img.update_attributes(pdf_image_url: cloudpdf)
            pdf_image_urls << $img.pdf_image_url
            # p $img
            # p "*"
            # p $img.pdf_image_url
          end

########## PRAWN #############
        end
        p "*"
            p pdf_image_urls
        Print.create(p_user_id: num, p_image_urls: pdf_image_urls)
########## LOB - ADDRESS #############
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
######### LOB - OBJECT #############

# sooooo..... this first 'if' works... we need to do more logic cause $img changes...
#   idk, iterate or make sure it's not nil... something... but i'm tired.
#   LATERZ
if pdf_image_urls != []
cloudimage = $img.pdf_image_url
p "*"*55
 p cloudimage
cloudimage["url"]

    $image = Image.where(pdf_image_url: cloudimage["url"] ).first
      @lob.objects.create(
        name: $image.instagram_id,
        file: $image.image_url,
        setting_id: "500"
      )
end
# ########## USERS - LOB - OBJECT #############
#     prints = Print.where(p_user_id: num)
#       lob_objects = []
#       prints.p_image_urls.each do |img_url|
#         lob_ojects << lob_object.img_url
#       end
#       @objects = []
#       lob_ojects.each do |obj|
#         @objects << obj[id]
#       end
# ########## LOB - JOB #############
#     @lob.jobs.create(
#       name: num + Date.today,
#       to: @lob_address[id],
#       objects: @objects
#     )
#     end
### end of big loop
    # end
  end
end
end