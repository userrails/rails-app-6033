class SampleMailer < ApplicationMailer
  def test_mail
    mail(to: 'shivraj.badu@domain.com',
         subject: 'Welcome mail')
  end
end