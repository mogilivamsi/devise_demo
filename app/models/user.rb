require 'two_factor'
class User < ApplicationRecord
  include Searchable
  searchable_scope ->(q){where("first_name || ' ' || last_name || ' ' || email || ' ' || phone_number LIKE ?", "%#{q}%")}

  after_create :create_otp

  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => ENV['secret_key_env']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
    def generate_jwt
    JWT.encode({ id: id,
                exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
    end

  def create_otp
    self.otp_required_for_login = true
    self.otp_secret = User.generate_otp_secret
    self.save!
  end

  def send_passcode
    response = TwoFactor.send_passcode(self.phone_number)

    if response['Status'].downcase == 'success'
      update_column(:session_key, response['Details'])
      true
    end
  end

def generate_password_token!
 self.reset_password_token = generate_token
 self.reset_password_sent_at = Time.now.utc
 save!
end

def password_token_valid?
 (self.reset_password_sent_at + 4.hours) > Time.now.utc
end

def reset_password!(password)
 self.reset_password_token = nil
 self.password = password
 save!
end

  def verify_passcode(passcode)
    res = TwoFactor.verify_passcode(session_key, passcode)
     res['Status'].downcase == 'success' && res['Details'] != "OTP Expired"
  end

private

def generate_token
 SecureRandom.hex(10)
end




end


#+ validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }
#+ validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }
