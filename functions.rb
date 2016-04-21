def has_auth (action)
  AuthGroup.all.each do |ag|
    case ag[action]
    when true
      return true 
    when nil
      return 'not found'
    end
  end
  return false
end

class As

  def repeatfirst
  	return saymyname
  end
  def initialize(name)
    @name = name
  end
  def saymyname
    return 'my name is '+@name
  end
  def name
    return @name
  end
  def repeatlast
  	return saymyname
  end

end