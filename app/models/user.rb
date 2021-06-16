class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]
  has_many :posts
  has_many :comments
  has_many :answers
  has_many :subscriptions, dependent: :delete_all

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def subscribed?(question)
    Subscription.where(user_id: id, question_id: question.id).first != nil
  end

  def self.send_daily_digest
    User.all do |user|
      DailyMailer.digest(user).deliver_later
    end
  end
end
