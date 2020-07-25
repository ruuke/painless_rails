class UserMutator
  class << self
    def discard(user)
      user.update(discarded_at: Time.zone.now)
    end

    def ban(user)
      user.update(baned_at: Time.zone.now)
    end

    def unban(user)
      user.update(baned_at: nil)
    end
  end
end
