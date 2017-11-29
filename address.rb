class Address
  attr_accessor :city, :zip, :street, :state

  def initialize(street, city, state, zip)
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def getStreet
    @street
  end

  def getCity
    @city
  end

  def getState
    @state
  end

  def getZip
    @zip
  end

  def setStreet(street)
    @street=street
  end

  def setCity(city)
    @city=city
  end

  def setState(state)
    @state=state
  end

  def setZip(zip)
    @zip=zip
  end
end
