class RepliesMailbox < ApplicationMailbox
  MATCHER = /support+(.+)@example.com/i

  def process
    return if user.blank?
    ticket.comments.create(user: user, body: mail.decoded)
  end

  def ticket
    user.tickets.find(ticket_id)
  end

  def ticket_id
    recipient = mail.recipients.find {|r| MATCHER.match?(r)}
    recipient[MATCHER, 1]
  end

  def user
    @user ||= User.find_by(email: mail.from)
  end
end
