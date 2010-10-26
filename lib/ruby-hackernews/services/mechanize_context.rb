module MechanizeContext

  @@contexts = {}

  def self.agent=(key)
    @@default = key
  end

  def agent
    @@default ||= :default
    @@contexts[@@default] = Mechanize.new unless @@contexts[@@default]
    return @@contexts[@@default]
  end

  def [](key)
    return @@contexts[key]
  end

  def require_authentication
    raise NotAuthenticatedError unless authenticated?
  end

  def authenticated?(key = :default)
    return @@contexts[key] && @@contexts[key].cookie_jar.jar.any?
  end

end