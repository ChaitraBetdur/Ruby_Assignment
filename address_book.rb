$LOAD_PATH << '.'

require "yaml"
require 'csv'
require_relative 'person'
require_relative 'address'

require "validate"

class AddressBook
include Validate
  puts Validate::VAR
   @@contacts=Array.new

   def open
     if File.exist?("contacts.yml")
       @@contacts = YAML.load_file("contacts.yml")
     end
   end


   def save
     File.open("contacts.yml", "w") do |file|
       file.write(@@contacts.to_yaml)
     end #file.open
   end


   def addContact

     puts "Enter First Name"
     fname=gets.chomp
     while !(Validate.isAlpha(fname)) do

       fname=gets.chomp
     end

     puts "Enter Last Name"
     lname=gets.chomp

     while !(Validate.isAlpha(lname)) do
      lname=gets.chomp
     end

     isExists=false
     for i in 0..@@contacts.length-1
       if fname==@@contacts[i].getfirstName and lname==@@contacts[i].getlastName

         isExists=true
         break
       end
     end
     if isExists
       puts "Contact already Exists"
         displayContactByIndex(i)

     else
       puts "Enter phone number"
       pnum=gets.chomp
       while !(Validate.isNum(pnum)) do

         pnum=gets.chomp
       end

       puts "Enter Address \n Street"
       street=gets.chomp
       while !( Validate.isAlpha(street) )do

         street=gets.chomp
       end
       puts"city"
       city=gets.chomp
       while !( Validate.isAlpha(city)) do

         city=gets.chomp
       end
       puts "state"
       state=gets.chomp
       while !( Validate.isAlpha(state)) do

         state=gets.chomp
       end
       puts "zip "
       zip=gets.chomp
       while !( Validate.isNum(zip)) do

         zip=gets.chomp
       end
   end
       addr = Address.new(street,city,state,zip)
       @@contacts.push(Person.new(fname,lname,pnum,addr))

       end




   def displayContactByIndex(i)

    puts @@contacts[i].getfirstName + " " + @@contacts[i].getlastName + ":"
    puts "       #{@@contacts[i].getphoneNum}"
    puts "       #{@@contacts[i].getAddress.getStreet}"
    puts "       #{@@contacts[i].getAddress.getCity}"
    puts "       #{@@contacts[i].getAddress.getState} , #{@@contacts[i].getAddress.getZip}"

   end

    def displayAllContacts

      for i in 0..@@contacts.length-1
        displayContactByIndex(i)
      end
    end

  def searchContact
    puts "Enter name to Search details"
    fname=gets.chomp
    counts=occurance(fname)
    #print counts
    if(counts==0)
      puts "No Such Contact"
    else
     for i in 0..@@contacts.length-1
       if fname==@@contacts[i].getfirstName
        displayContactByIndex(i)
       end
     end
    end
  end

  def sortContacts

    @@contacts.sort_by!{ |c| c.getfirstName+c.getlastName.downcase }
    puts "After Sorting"
    displayAllContacts

  end


  def deleteContact
    puts "Enter Contact name to Delete"
    fname = gets.chomp
     counts=occurance(fname)

      if(counts==0)
        puts "No Such Contact"
      elsif(counts>1)
        puts "Enter last Name"
        lname=gets.chomp
        isExists=false
        for i in 0..@@contacts.length-1
          if fname==@@contacts[i].getfirstName and lname==@@contacts[i].getlastName
            isExists=true
            puts "Are you sure? You want to delete #{fname}? Y/N"
            delete=gets.chomp
            if(delete='y'||delete='Y')
              puts "#{@@contacts[i].getfirstName} is deleted Successfully"
              @@contacts.delete(@@contacts[i])

            end
            break
          end
        end
        if(isExists==false)
          puts "No such Contact"
        end
      else
        for i in 0..@@contacts.length-1
          if fname==@@contacts[i].getfirstName
            puts "Are you sure? You want to delete #{fname}? Y/N"
            delete=gets.chomp
            if(delete='y'||delete='Y')
            puts "#{@@contacts[i].getfirstName} is deleted Successfully"
            @@contacts.delete(@@contacts[i])
            end
            break
          end

        end

        end
  end

#No of occurance of a contact name.
  def occurance(fname)
    counts=0
    for i in 0..@@contacts.length-1
      if fname==@@contacts[i].getfirstName
        counts+=1
      end
    end
      counts
  end


  def editContact
    puts "Enter Contact name to Edit"
    fname = gets.chomp
    counts=occurance(fname)
    if (counts==0)
      puts "No such contact"
    elsif(counts>1)
      puts "Enter Last name"
      lname=gets.chomp
      for i in 0..@@contacts.length-1
        if fname==@@contacts[i].getfirstName and lname==@@contacts[i].getlastName
          displayContactByIndex(i)
          @index=i
          break
        end
      end
      editByField(@index)
    else
      for i in 0..@@contacts.length-1
        if fname==@@contacts[i].getfirstName
          displayContactByIndex(i)
          @index=i
          break
        end
      end
      editByField(@index)
    end
  end


  def editByField(index)
    puts "Enter your choice"
    puts "1.Edit First Name and Last name\n2.Edit Phone Number\n3.Edit Address"
    @choice =gets.chomp
    case @choice
      when "1"
        puts "Enter First Name"
        fname=gets.chomp
        puts "Enter Last name"
        lname=gets.chomp
        @@contacts[index].setfirstName(fname)
        @@contacts[index].setlastName(lname)
      when "2"
        puts "Enter Phone Number"
        pnum=gets.chomp
        @@contacts[index].setphoneNum(pnum)
      when "3"
        puts "Enter Address\nStreet"
        street=gets.chomp
        puts "city"
        city=gets.chomp
        puts "state"
        state=gets.chomp
        puts "zip"
        zip=gets.chomp
        @@contacts[index].getAddress.setStreet(street)
        @@contacts[index].getAddress.setCity(city)
        @@contacts[index].getAddress.setState(state)
        @@contacts[index].getAddress.setZip(zip)
    end
  end
end






