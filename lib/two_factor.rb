require 'httparty'

class TwoFactor
  include HTTParty

  # TWO_FACTOR_API_KEY = '1ec5ab04-d67f-11eb-8089-0200cd936042'

  def self.send_passcode(phone,otp)
    p "======otptpptpt"
    p otp
    response = get("https://2factor.in/API/V1/#{ENV["TWO_FACTOR_API_KEY"]}/SMS/+91#{phone}/#{otp}")
    response.parsed_response
  end

  def self.verify_passcode(session_key, code)
    response = post("https://2factor.in/API/V1/#{ENV["TWO_FACTOR_API_KEY"]}/SMS/VERIFY/#{session_key}/#{code}")
    response.parsed_response
  end
end