class Diary
  def initialize
    @diary_entries = []
    @tasks = []
    @contacts = []
  end

  # Diary entries
  def add_entry(entry)
    @diary_entries << entry
  end

  def all_entries
    string = ""
    @diary_entries.each { |item| string += (item.entry_name + " - " + item.entry + "\n") }
    return string
  end

  def longest_entry_read(wpm, minutes)
    max_read = wpm * minutes
    readable_entries = @diary_entries.select{ | item | item.entry_length <= max_read }

    fail "Sorry, you don't have time to read right now!" if readable_entries == []

    longest_entry = readable_entries.sort_by { | item | item.entry_length }.last
    return "You can read an entry from #{longest_entry.entry_name}"
  end

  # Tasks
  def add_task(task)
    @tasks << task
  end

  def all_tasks
    string = ""
    @tasks.each { |item| string += (item.task + "\n") }
    return string
  end

  def complete_tasks
    string = ""
    @tasks.each do |item|
      if item.status == 'complete'
        string += (item.task + "\n") 
      end
    end
    return string
  end

  def incomplete_tasks
    string = ""
    @tasks.each do |item|
      if item.status == 'incomplete'
        string += (item.task + "\n") 
      end
    end
    return string
  end

  # Contacts
  def add_contact(contact)
    @contacts << contact
  end

  def all_contacts
    string = ""
    @contacts.each { |item| string += item.name + " - " + item.number + "\n"}
    return string
  end
end