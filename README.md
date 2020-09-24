# README

* Rich Text with Trix editor & storage with ActiveStorage
```
bin/rails action_text:install
# this install migration and other required packages
```
* Zeitwerk new code loader for Ruby
It is the autoloader for Rails 6, which eliminates use cases for require_dependency, including STIs and is based on Module#autoload.

* Webpack a default JS bundler, replaced the default Rails Asset Pipeline, uses JS package manager like yarn or npm

* Parallel Testing in Rails 6 by defafult, each testing worker gets its own db and runs into own thread which speeds the testing suite.

* Multi DB support which has master-slave DB strategy.

* Action MailBox
```
rails action_mailbox:install
rails db:migrate
rails webpacker:install
```

# Setup

```
$ rails action_mailbox:install
$ rails db:migrate
```


* If you check the migration, you will see that, table action_mailbox_inbound_emails are created with columns status, message_id, message_checksum
* ApplicationMailbox class is created in mailboxes dir.

```
class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  # routing is configuration of incoming email for example you can set support@example.com and :somewhere can be mailbox class name for e.g Support which will redirect to the Support Mailbox
end

```

Now create some scaffold User, Ticket, Comment

```
rails g scaffold User name:string email:string
rails g scaffold Ticket title:string body:text user:references
rails g scaffold Comment body:text user:references ticket:references
```

Now generate Mailbox

```
rails g mailbox Support

```

Now if you check SupportMailbox class you will following

```
class SupportMailbox < ApplicationMailbox
  def process
    # we can use methods defined by mail gem here
    # for example mail.from mail.subject mail.to mail.decoded
  end
end
```

## Run rails s and webpacker
```
./bin/webpacker-dev-server
```

## Testing inbound emails on Development Environment through UI

```
http://localhost:3000/rails/conductor/action_mailbox/inbound_emails/new
```

Here From field is the email on the users list or table - who are sending inbound email
To field is the receiver that is support@example.com or the email registered on the mailbox
Subject, Body in decoded form are the one which is sent by that user

To see the list of inbound emails visit 'http://localhost:3000/rails/conductor/action_mailbox/inbound_emails'

You are able to see processing bounced delivered emails here

You can also see full email content by clicking on each of the mail from the list

We can also repeateadly route same email again.

## Now it's time to create Reply to above generated mail

Let's say support can send an email to user and if user want to reply the email, then this feature is used


## Create new mailbox let say `replies`

```
rails g mailbox Replies
```

```
from: shiv@gmail.com
to: support+1@example.com
Body: reply to email body, generally subject can be empty
```