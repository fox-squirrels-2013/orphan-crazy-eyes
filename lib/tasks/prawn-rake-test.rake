require 'open-uri'

namespace :db do
  desc "vanessa tests prawn on heroku"
  task :prawntest => :environment do

        Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|
          pdf.image open("http://distilleryimage0.s3.amazonaws.com/0ad0616c127e11e3a7ec22000ae904db_5.jpg")
          pdf.render_file('vanessatest.pdf')
          newpdf = File.open('vanessatest.pdf')
          cloudpdf = Cloudinary::Uploader.upload(newpdf)
          img = Image.where(id: 5).first
          img.update_attributes(pdf_image_url: cloudpdf["url"])
        end

  end

end
[
    [{:image => instagram, :position => :center, :fit => [100, 200]}]
    ]


pdf = Prawn::Document.new
data = [ [instagram = open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg") ]]
{:image => instagram, :position => :center, :fit => [100, 200]}
pdf.table(data)
pdf.render_file 'test_646newcloudpdf.pdf'



def self.generate(filename,options={},&block)
      pdf = new(options,&block)
      pdf.render_file(filename)
    end

    set_content_type

Prawn::Document.generate('test_435generatecloudpdf.pdf', :template => open('http://res.cloudinary.com/dvm/image/upload/v1386113592/zls6esrvf6jdn86wvaws.pdf'), :page_layout => :portrait) do |pdf|
instagram = open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg")
pdf.table [
    [{:image => instagram, :position => :center, :fit => [100, 200]}]
    ]
end

pdf.image(instagram)

, :fit => [100, 200], :at => [0,0]

) build_pdf_object('test_435generatecloudpdf.pdf')


pdf.image open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg", :at => [0,0])

    pdf.image open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_8.jpg")
        @lob.objects.create(
            name: "another_test_324",
            file: "http://res.cloudinary.com/dvm/image/upload/v1386113207/thl0v8bjbxydwlnorrl5.pdf",
            setting_id: "500"
            )


white BG pdf template
http://res.cloudinary.com/dvm/image/upload/v1386113592/zls6esrvf6jdn86wvaws.pdf

# :page_layout</tt>:: Either <tt>:portrait</tt> or <tt>:landscape</tt>
    # <tt>:margin</tt>:: Sets the margin on all sides in points [0.5 inch]
    # <tt>:left_margin</tt>:: Sets the left margin in points [0.5 inch]
    # <tt>:right_margin</tt>:: Sets the right margin in points [0.5 inch]
    # <tt>:top_margin</tt>:: Sets the top margin in points [0.5 inch]
    # <tt>:bottom_margin</tt>:: Sets the bottom margin in points [0.5 inch]
    # generate_margin_box()


          # Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|

    # if Date.today.day == 1

    # end

# http://res.cloudinary.com/dvm/image/upload/v1386098332/qdetwdwtvbvmuqu2yr0y.pdf


# Prawn::Document.new(:page_size => [1800, 1200], :background => "#{Rails.root.to_s}/whiteBG.jpg") do |pdf|
#     pdf.render_file('test4test.pdf')
# end