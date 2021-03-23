class SequenceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sequence_mailer.dispatch.subject
  #
  def dispatch
    user = params[:user]
    @step = params[:step]
    subject = @step.mail_subject
    should_run = MiddlewareStack.new.run(occurrence)
    if should_run
        mail(
            to: user.email,
            subject: subject
        )
        occurrence.update!(is_sent: true, sent_at: DateTime.now)
    end

  end
end
