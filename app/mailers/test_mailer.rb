class TestMailer < ActionMailer::Base
  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'pablo.haguet@skema.edu',
      :from => 'investment@avant-garde.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
