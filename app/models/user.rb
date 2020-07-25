class User < ApplicationRecord
  def admin?
    role_id == Role.admin.id
  end
end
