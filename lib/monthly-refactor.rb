




# users_pics.each do |image_object|
Prawn::Document.generate('new_test.pdf', skip_page_creation: true, :page_size => [288, 432]) do |pdf|
  blam = http://distilleryimage7.s3.amazonaws.com/2163359061ca11e28a3222000a9f17b2_7.jpg
          # pdf.transparent(1) do
            # pdf.start_new_page(:background_color => "234575")
            newpdf = pdf.image open(blam), :fit => [220,220], :position => :center
          # end
          cloudpdf = Cloudinary::Uploader.upload(newpdf)
        end
          # image_object.update_attributes(pdf_image_url: cloudpdf["url"])
          # pdf_image_urls << image_object.pdf_image_url
      # end

        blam = "http://distilleryimage7.s3.amazonaws.com/2163359061ca11e28a3222000a9f17b2_7.jpg"


      Prawn::Document.generate('new_test.pdf', skip_page_creation: true, :page_size => [288, 432]) do |pdf|
        pdf.start_new_page
        pdf.image open("http://distilleryimage7.s3.amazonaws.com/2163359061ca11e28a3222000a9f17b2_7.jpg"), :fit => [220,220], :position => :center
          end
        newpdf = File.open('new_test.pdf')
        cloudpdf = Cloudinary::Uploader.upload(newpdf)
        puts cloudpdf["url"]
