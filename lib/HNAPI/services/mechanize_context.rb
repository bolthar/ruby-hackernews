
module MechanizeContext

  def self.create(key = :default, agent = Mechanize.new)
    @@contexts ||= {}
    @@contexts[key] = agent
  end

  def self.agent=(key)
    @@default = key
  end

  def agent
    @@default ||= :default
    return @@contexts[@@default]
  end

  def [](key)
    return @@contexts[key]
  end

  def require_authentication
    raise NotAuthenticatedError unless authenticated?
  end

  def authenticated?(key = :default)
    return @@contexts[key].cookie_jar.jar.any?
  end

end