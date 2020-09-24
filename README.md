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