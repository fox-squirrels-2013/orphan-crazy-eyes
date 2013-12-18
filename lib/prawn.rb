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

end
