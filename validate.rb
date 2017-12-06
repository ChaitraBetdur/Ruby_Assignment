module Validate
  VAR = 10
  def self.isAlpha(word)
    if /\d/.match( word)
      puts "Invalid Input, Numbers are not allowed\n Enter again"
      return false
    else
      return true
    end
  end

  def self.isNum(num)
    if /\d/.match( num)
      return true
    else
      puts "Invalid Input, only Numbers are allowed\n Enter again"
      return false
    end
  end
end