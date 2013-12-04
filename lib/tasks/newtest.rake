#   Prawn::Document.new(:page_size => [1800, 1200]) do
#     image do
#       open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg")
#       open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg"), :fit => [640,640], :position => :center
#     end
#   render_file('idasdfdan.pdf')
#   end


# Prawn::Document.generate('dpi.pdf', skip_page_creation: true, :page_size => [288, 432]) do |pdf|
#   pdf.transparent(1) do
#   pdf.start_new_page(:background_color => "234575")
#   pdf.image open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg"), :fit => [220,220], :position => :center
# end
# end

#   pdf.absolute_top_left(:at => [0,0])

#   end:margin => [0,0,0,0], :margin_top => -50
#   bounding_box([0, cursor], :width => 1800, :height => 1200) do
#   image open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg"), :fit => [640,640], :position => :center

#   stroke_rectangle [780,120], 500, 50 do
#   fill_color "FFFFCC"
#   stroke_color "CCCCCC"


# "http://res.cloudinary.com/dvm/image/upload/v1386135055/mwnvmc8shrqkjfon3skm.jpg"



# ,:background_color => 'CCFF99', :position => :center



# Cloudinary::Uploader.upload("/Users/apprentice/Desktop/orphan-crazy-eyes/dpi.pdf")




#     @lob.objects.create(
#               name: "correct_dpi_test",
#               file: "http://res.cloudinary.com/dvm/image/upload/v1386139464/dp750uebjs1et9k87pmr.pdf",
#               setting_id: "500"
#               )