class Diary
  def initialize
    @diary_entries = []
  end

  def add_entry(entry)
    @diary_entries << entry
  end

  def all_entries
    string = ""
    @diary_entries.each { |item| string += (item.entry_name + " - " + item.entry + "\n") }
    return string
  end
end