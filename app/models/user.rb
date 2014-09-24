class User < ActiveRecord::Base
  has_many :votes

  def self.from_auth(auth)
    where('id = ?', auth["id"]).first || create_user_from_auth(auth)
  end

  def self.create_user_from_auth(auth)
    create! do |v|
      v.id = auth["id"]
      v.email = auth["email"]
      v.name = auth["name"]
      v.save!
    end
  end
end
