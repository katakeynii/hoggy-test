class SequenceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sequence_mailer.dispatch.subject
  #
  def dispatch
    user = params[:user]
    @step = params[:step]
    occurrence = params[:occurrence]

    subject = step.subject

    mail(
        to: user.email,
        subject: subject
    )
  end
end
