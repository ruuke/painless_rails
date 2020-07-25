class UserService
  class << self
    def create(user, create_company = false)
      geocode(user)
      set_default_color(user)
      create_a_company(user) if create_company
    end
  end

  private

  def geocode(user)
    lat, long = Geocoder.coordinates(user.address)
    user.update_attributes(lat: lat, lng: long))
  end

  def create_a_company(user)
    Company.create(title: 'rand', owner_id: user.id, address: user.adress, lat: user.lat, lng: user.lng)
  end

  def set_default_color(user)
    user.update(color: 'ffffff')
  end
end
