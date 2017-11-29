

class Person
  attr_accessor :last_name, :first_name, :address, :phone_number

  def initialize(firstName, lastName, phoneNum, addr)
    @first_name = firstName
    @last_name = lastName
    @phone_number = phoneNum
    @address = addr
  end

  def getfirstName
    @first_name
  end

  def getlastName
    @last_name
  end

  def getphoneNum
    @phone_number
  end

  def getAddress
    @address
  end

  def setfirstName(fname)
    @first_name=fname
  end

  def setlastName(lname)
    @last_name=lname
  end

  def setphoneNum(pnum)
    @phone_number=pnum
  end
end
