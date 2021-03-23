# Preview all emails at http://localhost:3000/rails/mailers/sequence_mailer
class SequenceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sequence_mailer/dispatch
  def dispatch
    SequenceMailer.dispatch
  end

end
