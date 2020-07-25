class UserCreateForm < User
  include ActiveFormModel

  # list all the permitted params
  permit :name, :adress, :role_id

  # add validation if necessary
  # they will be merged with base class' validation
  validate :password, presence: true

  # optional data normalization
  def email=(email)
    if email.present?
      write_attribute(:email, email.downcase)
    else
      super
    end
  end
end
