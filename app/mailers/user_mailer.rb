class UserMailer < ApplicationMailer
  default from: 'trackit.mah@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(user)
    @greeting = "Hi"

    mail to: user.email
  end

  def registration_email()
    mail to: user.email
  end

  def proposal_submitted(proposal)
    @proposal = proposal
    mail to: proposal.user.email
  end

  def approved_email(approver, proposal)
    @approver = approver
    @proposal = proposal
    mail to: proposal.user.email
  end

  def declined_email(approver, proposal)
    @approver = approver
    @proposal = proposal
    mail to: proposal.user.email
  end

  def apply_email(motivation, proposal_name)
    @motivation = motivation
    @proposal_name = proposal_name
    mail to: motivation.user.email
  end

  def apply_approved_email(motivation, proposal_name)
    @motivation = motivation
    @proposal_name = proposal_name
    mail to: motivation.user.email
  end

  def apply_declined_email(motivation, proposal_name)
    @motivation = motivation
    @proposal_name = proposal_name
    mail to: motivation.user.email
  end

end
