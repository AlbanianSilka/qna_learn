class DailyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.digest.subject
  #
  def digest(user)
    @post = Post.where('created_at < ?', 1.day.ago)
    @user = user
    Rails.logger.info('sent')
    mail to: user.email, subject: "Daily Digest"
  end
end
