# class WelcomeController < ApplicationController
#     def index
#     end
#     def send_mail
       
#         recipients = ["ankit.patidar@preciousinfosystem.com", "ankitpatidar01650@gmail.com","ankit.patidar@deeporion.com"]
#         recipients.each do |recipient|
#         WelcomeMailer.send_welcome_mail(recipient).deliver_now
#     rescue SocketError => e
#         # Log or handle the error
#         Rails.logger.error("Failed to send email to #{recipient}: #{e.message}")
      
#         end
#     end
# end
class WelcomeController < ApplicationController
    def send_mail
      recipients = ["ankit.patidar@preciousinfosystem.com", "aman.ahirwar@preciousinfosystem.com", "ankit.patidar@deeporion.com"]
      recipients.each do |recipient|
        send_email_with_retry(recipient)
      end
    end
 