# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  comment      :string(255)
#

class ApiKey < ActiveRecord::Base
  before_create :generate_access_token

  private
  def generate_access_token
    begin
      self.access_token ||= SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
