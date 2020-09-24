class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /support@example.com/i => :support
  routing RepliesMailbox::MATCHER => :replies
  # support+1212@example.com
end
