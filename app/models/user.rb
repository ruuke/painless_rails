class User < ApplicationRecord
  attr_accessor :create_a_company
  attr_accessor :moderation_mode

  has_many :organizations

  validates_presence_of :name, :email, :address
  validates_confirmation_of :email, on: :create
  validates_acceptance_of :terms_agreed, on: :create
  validates_presence_of :profession, :workplace, if: :in_moderation_mode?

  # geocoded_by :address

  # before_save :geocode, on: :create
  before_validation :strip_and_downcase_username, on: :create
  before_validation :set_default_color_theme, on: :create

  after_save :create_default_organization, if: :create_company?

  def create_default_organization
    Company.create(address: address, title: "#{username}'s organization", user: self)
  end

  def in_moderation_mode?
    !!moderation_mode
  end

  def create_company?
    !!create_a_company
  end

  def strip_and_downcase_username; end
  def set_default_color_theme; end

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
