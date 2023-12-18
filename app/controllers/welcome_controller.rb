class WelcomeController < ApplicationController
    def send_mail
      recipients = ["hrishabh@preciousinfosystem.com","aman.nekiya@preciousinfosystem.com", "ishika.upadhyay@preciousinfosystem.com","ankit.patidar@preciousinfosystem.com"]
      recipients.each do |recipient|
        send_email_with_retry(recipient)
      end
    end
  
    private
  
    def send_email_with_retry(recipient, retry_attempts = 3)
      attempts = 0
  
      begin
        WelcomeMailer.send_welcome_mail(recipient).deliver_later
      rescue SocketError => e
        attempts += 1
        if attempts < retry_attempts
          sleep(1) # Wait for 1 second before retrying
          retry
        else
          # Log or handle the error
          Rails.logger.error("Failed to send email to #{recipient}: #{e.message}")
        end
      end
    end
  end
  