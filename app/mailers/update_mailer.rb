class UpdateMailer < ApplicationMailer
  def notify(user, post)
    @post = post
    @user = user
    mail to: user.email
  end
end
