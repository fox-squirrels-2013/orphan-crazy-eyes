require 'open-uri'

namespace :db do
  desc "vanessa tests prawn on heroku"
  task :monthly_check => :environment do

      def pdf_maker#("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_5.jpg", vanessatest, image_id)
        Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|
          pdf.image open("http://distilleryimage3.s3.amazonaws.com/53c697a053cf11e38e961244789a1353_5.jpg")
          pdf.render_file('vanessatest.pdf')
          newpdf = File.open('vanessatest.pdf')
          cloudpdf = Cloudinary::Uploader.upload(newpdf)
          img = Image.where(id: 1).first
          img.update_attributes(pdf_image_url: cloudpdf["url"])
        end
      end

  end
end