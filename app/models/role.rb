class Role < ApplicationRecord
  def self.general
    Role.where(name: 'general')
  end

  def self.admin
    Role.where(name: 'admin')
  end
end
