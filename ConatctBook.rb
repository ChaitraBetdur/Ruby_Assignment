require_relative 'address_book'

contactDetails=AddressBook.new
while (true)

  puts "Enter a Choice"
  puts "1.Add a New Contact to the Address Book \n2.Display All Contacts \n3.Search Contact\n4.Sort Contacts\n5.Edit Contact Details\n6.Delete Contact"
  choice=gets.chomp
  case choice
    when "1"
      contactDetails.addContact
      contactDetails.save
    when "2"
      contactDetails.open
      contactDetails.displayAllContacts
      contactDetails.save
    when "3"
      contactDetails.open
      contactDetails.searchContact
      contactDetails.save
    when "4"
      contactDetails.open
      contactDetails.sortContacts
      contactDetails.save
    when "5"
      contactDetails.open
      contactDetails.editContact

      contactDetails.save

    when "6"
      contactDetails.open
      contactDetails.deleteContact
      contactDetails.save
    else
      puts "you gave me #{choice} i have no idea what to do with that"
      contactDetails.save
      break
  end
end