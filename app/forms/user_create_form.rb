class UserCreateForm < User
  include ActiveFormModel

  permit :name, :adress, :role_id

  validates_presence_of :name, :email, :address
  validates_confirmation_of :email, on: :create
  validates_acceptance_of :terms_agreed, on: :create
  validates_presence_of :profession, :workplace, if: :admin?

  def name=(value)
    self[:name] = value.downcase
  end

  def email=(value)
    self[:email] = value.downcase
  end

  def role_id=(value)
    self[:role_id] = value || Role.general.id
  end
end
