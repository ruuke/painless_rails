class Role < ApplicationRecord
  def self.general
    Role.where(name: 'general')
  end
end
