




users_pics.each do |image_object|
  Prawn::Document.generate('new_test.pdf', skip_page_creation: true, :page_size => [288, 432]) do
    start_new_page
    image open(image_object.image_url), :fit => [220,220]
  end
  newpdf = File.open('new_test.pdf')
  cloudpdf = Cloudinary::Uploader.upload(newpdf)
  puts cloudpdf["url"]
  image_object.update_attributes(pdf_image_url: cloudpdf["url"])
  pdf_image_urls << image_object.pdf_image_url
end



