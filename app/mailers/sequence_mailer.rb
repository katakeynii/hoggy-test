class SequenceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sequence_mailer.dispatch.subject
  #
  def dispatch
    puts "1 =======>"
    user = params[:user]
    @step = params[:step]
    # occurrence = params[:occurrence]
    puts "2 =======>"

    subject = @step.mail_subject
    puts user.inspect
    puts "3 =======>"

    mail(
        to: user.email,
        subject: subject
    )
  end
end
