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

# 4 -> add tasks 
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
end

class Task
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
        # marks an entry as complete
    end

    def complete?
        marks a task as complete
    end
end

class Diary
    def add_entry(entry)
        # adds an instance of entry
    end

    def all_entries
        # returns all added entries
    end

    def longest_entry_read(wpm, minutes)
        # returns the entry_name of the longest entry that can be read
    end

    def add_task(task)
        # adds an instance of task
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

# I;ntegration

# 1 User can read all their diary entries
diary = Diary.new
entry1 = Task.new("Monday 1 Jan", "One Two Three Four Five")
entry2 = Task.new("Tuesday 2 Jan", "One Two Three Four Five Six")
entry3 = Task.new("Wednesday 3 Jan", "One Two Three ")
diary.add_entry(entry1)
diary.add_entry(entry2)
diary.add_entry(entry3)
expect(diary.all_entries).to eq "Monday 1 Jan - One Two Three Four Five\nTuesday 2 Jan - One Two Three Four Five six\nWednesday 3 Jan - One Two Three"

# 2 User can read the longest entry possible in a given time
diary = Diary.new
entry1 = Task.new("Monday 1 Jan", "One Two Three Four Five")
entry2 = Task.new("Tuesday 2 Jan", "One Two Three Four Five Six")
entry3 = Task.new("Wednesday 3 Jan", "One Two Three ")
diary.add_entry(entry1)
diary.add_entry(entry2)
diary.add_entry(entry3)
diary.longest_entry_read(2, 3) # => "You can read an entry from Tuesday 2 Jan"

# 3 User cannot read any entries if there is not enough time
diary = Diary.new
entry1 = Task.new("Monday 1 Jan", "One Two Three Four Five")
entry2 = Task.new("Tuesday 2 Jan", "One Two Three Four Five Six")
entry3 = Task.new("Wednesday 3 Jan", "One Two Three ")
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

