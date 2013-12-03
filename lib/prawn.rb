module PrawnPDF

  def pdf_maker(jpg_url, instagram_id, image_id)
    Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|
      pdf.image open(jpg_url)
      pdf.render_file('#{instagram_id}.pdf')
      newpdf = File.open('#{instagram_id}.pdf')
      cloudpdf = Cloudinary::Uploader.upload(newpdf)
      img = Image.where(id: image_id).first
      img.update_attributes(pdf_image_url: cloudpdf)
    end
  end






#   # output: pdf
#   def pdf_maker(jpg_url, instagram_id)
#     Prawn::Document.new(:page_size => [715, 1072.5]) do |pdf|
#       pdf.image open(jpg_url)
#       pdf.render_file('#{instagram_id}.pdf')
#       newpdf = File.open('#{instagram_id}.pdf')
#     end
#   end
#   # output: pdf

# def pdf_url(pdf_image_url)
#   Cloudinary::Uploader.upload(image_u)
#     @meme = Meme.create(title: params[:meme][:title], image_url: clres["url"])
# end

end



# pdf = Prawn::Document.new
#     pdf.move_down 70

#     pdf.text("Prawn Rocks")
#     pdf.render_file('prawn.pdf')
#     pdf_file = File.open('prawn.pdf')

#     pdff = Pdffile.new()
#     pdff.pdffile_file = pdf_file
#     pdff.user_id = todays_user.id
#     pdff.save