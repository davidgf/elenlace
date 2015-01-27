class PurchaseMailer < ActionMailer::Base
  default from: "facebodanet@gmail.com"

  def info_mail(contact_details)
  	@email = contact_details[:email] || "facebodanet@gmail.com"
  	@phone = contact_details[:phone] || ""
  	mail(to: "facebodanet@gmail.com", subject: 'Información Faceboda')
  end
end
