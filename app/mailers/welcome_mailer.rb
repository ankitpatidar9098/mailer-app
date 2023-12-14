class WelcomeMailer < ApplicationMailer
    def send_welcome_mail
        mail(to:"ankit.patidar@preciousinfosystem.com",from:"enter@gmail.com",subject:"testingmail")
    end
end
