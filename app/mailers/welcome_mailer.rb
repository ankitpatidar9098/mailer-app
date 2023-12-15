# class WelcomeMailer < ApplicationMailer
#     def send_welcome_mail(recipient)
       
#         attachments.inline["Untitled.jpg"] = File.read("#{Rails.root}/app/assets/images/Untitled.jpg")
        
#         mail(to: recipient, from:"enter@gmail.com",subject:"testingmail")
#         end
    
# end
class WelcomeMailer < ApplicationMailer
    def send_welcome_mail(recipient)
      retries = 3
  
      begin
        attachments.inline["Untitled.jpg"] = File.read("#{Rails.root}/app/assets/images/Untitled.jpg")
        mail(to: recipient, from: "enter@gmail.com", subject: "testingmail")
      rescue Net::OpenTimeout => e
        retries -= 1
        retry if retries.positive?
        # Log or handle the error after retries
        Rails.logger.error("Failed to send email to #{recipient}: #{e.message}")
      end
    end
  end
  