class User < ApplicationRecord
  def name=(value)
    self[:name] = value.downcase
  end

  def email=(value)
    self[:email] = value.downcase
  end
end
