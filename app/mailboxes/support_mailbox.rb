class SupportMailbox < ApplicationMailbox
  def process
    # take required keys from mail object
    return if user.blank?

    Ticket.create(user: user, title: mail.subject, body: mail.decoded)
  end

  def user
    @user ||= User.find_by(email: mail.from)
  end
end
