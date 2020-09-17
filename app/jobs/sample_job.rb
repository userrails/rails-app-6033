class SampleJob
  include Sidekiq::Worker

  def perform
    puts "Job executed successfully"
  end
end