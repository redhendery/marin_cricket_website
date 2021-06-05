# frozen_string_literal: true

# Contact form validates presence and compliance of form submissions
class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :phone
  attribute :message
  attribute :ham_sandwich

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true, length: { minimum: 6, maximum: 15 }
  validates :message, presence: true, length: { minimum: 10 }

  def headers
    {
      subject: 'Contact from completed from marincricketclub.com',
      to: 'jaideep.nair@gmail.com, nicklynam721@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
