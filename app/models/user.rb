class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    unless happiness.nil? || nausea.nil?
      if happiness > nausea
        "happy"
      elsif happiness < nausea
        "sad"
      else
        "neutral"
      end
    end
  end

  def admin?
    self.admin
  end
end
