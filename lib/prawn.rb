module PrawnPDF

  def pdf_maker(pdf_image_url)
    Prawn::Document.generate('#{instagram_id}.pdf', :page_size => [715, 1072.5]) do |pdf|
      pdf.image open(image_url)
    end
  end

def pdf_url(image_url)
  Cloudinary::Uploader.upload(params[:meme][:image_url])
    @meme = Meme.create(title: params[:meme][:title], image_url: clres["url"])
    redirect_to meme_path(@meme)


end