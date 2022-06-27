# THE PROBLEM
# 1 -> record entries, add to a diary
As a user
So that I can record my experiences
I want to keep a regular diary

# 2 -> read entries from diary
As a user
So that I can reflect on my experiences
I want to read my past diary entries

# 3 -> read entries from diary based on time given and reading speed
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

# 4 -> add tasks to be stored in the diary 
As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

# 5 -> add contacts with phone numbers. Read contacts from my diary.
As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

# THE CLASS INTERFACE

class Contact
    def initialize(name, number)
        # initializes with contact name and number
    end

    def valid?
        # checks if number is valid - called on by add
    end

    def add
        # returns contact if the number is 11 didgets and starts with 07
    end
end

class DiaryEntry
# attr_reader :entry_name
# attr_reader :entry
    def initialize(entry_name, entry)
    end

    def entry_name
        # returns the entry name
    end

    def entry
        # returns the entry 
    end

    def entry_length
        # returns the entry length in words
    end
end

class Task
    def initialize(task)
        # creates the task
        # status is incomplete
    end

    def mark_complete
        # marks a task as complete
    end

    def complete?
       # returns true if task is complete
    end
end

class Diary
    def initialize
        initializes with an empty array of contacts, tasks and diary entries
    end

    def add_entry(entry)
        # adds an instance of DiaryEntry
    end

    def all_entries
        # returns all added entries
    end

    def longest_entry_read(wpm, minutes)
        # returns the entry_name of the longest entry that can be read
    end

    def add_task(task)
        # adds an instance of Task
    end

    def all_tasks
        # returns a list of all tasks
    end

    def complete_tasks
        returns all complete tasks
    end

    def incomplete_tasks
        returns all incomplete tasks
    end

    def add_contact(contact)
        # adds an instance of contact
    end

    def all_contacts
       # returns all contacts and their phone numbers
    end

end

# TESTS

# Integration (Diary class)

# 1 User can read all their diary entries
diary = Diary.new
entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
entry2 = DiaryEntry.new("Tuesday 2 Jan", "One Two Three Four Five Six")
entry3 = DiaryEntry.new("Wednesday 3 Jan", "One Two Three ")
diary.add_entry(entry1)
diary.add_entry(entry2)
diary.add_entry(entry3)
expect(diary.all_entries).to eq "Monday 1 Jan - One Two Three Four Five\nTuesday 2 Jan - One Two Three Four Five six\nWednesday 3 Jan - One Two Three"

# 2 User can read the longest entry possible in a given time
diary = Diary.new
entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
entry2 = DiaryEntry.new("Tuesday 2 Jan", "One Two Three Four Five Six")
entry3 = DiaryEntry.new("Wednesday 3 Jan", "One Two Three ")
diary.add_entry(entry1)
diary.add_entry(entry2)
diary.add_entry(entry3)
diary.longest_entry_read(2, 3) # => "You can read an entry from Tuesday 2 Jan"

# 3 User cannot read any entries if there is not enough time (fail message?)
diary = Diary.new
entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
entry2 = DiaryEntry.new("Tuesday 2 Jan", "One Two Three Four Five Six")
entry3 = DiaryEntry.new("Wednesday 3 Jan", "One Two Three ")
diary.add_entry(entry1)
diary.add_entry(entry2)
diary.add_entry(entry3)
diary.longest_entry_read(1, 1) # => "Sorry, you don't have time to read right now!"

# 4 User can read all their tasks 
diary = Diary.new
task1 = Task.new("Walk the dog")
task2 = Task.new("Walk the pig")
task3 = Task.new("Walk the frog")
diary.add_task(task1)
diary.add_task(task2)
diary.add_task(task2)
expect(diary.all_tasks).to eq "Walk the dog\nWalk the pig\nWalk the frog"

# 5 User can read all their completed tasks 
diary = Diary.new
task1 = Task.new("Walk the dog")
task2 = Task.new("Walk the pig")
task3 = Task.new("Walk the frog")
diary.add_task(task1)
diary.add_task(task2)
diary.add_task(task2)
task2.mark_complete
expect(diary.complete_tasks).to eq "Walk the pig"

# 6 User can read all their incomplete tasks 
diary = Diary.new
task1 = Task.new("Walk the dog")
task2 = Task.new("Walk the pig")
task3 = Task.new("Walk the frog")
diary.add_task(task1)
diary.add_task(task2)
diary.add_task(task2)
task2.mark_complete
expect(diary.incomplete_tasks).to eq "Walk the dog\nWalk the frog"

# 7 User can read all their contacts
diary = Diary.new
contact1 = Contact.new("Miranda", "07892398731")
contact2 = Contact.new("Olivia", "07892398732")
contact3 = Contact.new("Lauren", "07892398733"")
diary.add_contact(contact1)
diary.add_contact(contact2)
diary.add_contact(contact3)
expect(diary.all_contacts).to eq "Miranda - 07892398731\nOlivia - 07892398732\nLauren - 07892398733"

# 7 If user adds an invalid contact, it is not displayed in the list
diary = Diary.new
contact1 = Contact.new("Miranda", "07892398731")
contact2 = Contact.new("Olivia", "0789239873")
contact3 = Contact.new("Lauren", "07892398733"")
diary.add_contact(contact1)
diary.add_contact(contact2)
diary.add_contact(contact3)
expect(diary.all_contacts).to eq "Miranda - 07892398731\nLauren - 07892398733"

# Task class

# 1 User can mark a task as complete DONE
task1 = Task.new("Walk the dog")
task1.mark_complete
result = task1.complete? => true

# 2 Return a fail message if #complete? is called on an incomplete task DONE
task1 = Task.new("Walk the dog")
result = task1.complete? => "Your task is not completed"

# DiaryEntry class

# 1 User can read the entry DONE
entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
result = entry1.entry
result => "One Two Three Four Five"

# 2 User can read the #entry_name for the entry DONE
entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
result = entry1.entry_name
result => "Monday 1 Jan"

# 3 Returns how many words are in an entry DONE
entry1 = DiaryEntry.new("Monday 1 Jan", "One Two Three Four Five")
result = entry1.entry_length
result => 5

# Contact

# Adds a contact if the phone number is valid -MAYBE REMOVE AS CHECKED UP ^ NO RETURNS FOR CONTACTS CLASS
contact1 = Contact("Miranda", 07123456789)
result = contact.add
result = "Miranda - 07123456789"

# Fails if contact number is not valid
contact1 = Contact("Miranda", 0712345678)
result = contact1.add
result = "Please check the phone number you are trying to add is correct"

