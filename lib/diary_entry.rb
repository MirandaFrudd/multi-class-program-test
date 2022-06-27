class DiaryEntry
    attr_reader :entry_name
    attr_reader :entry

    def initialize(entry_name, entry)
        @entry_name = entry_name
        @entry = entry
    end

    def entry_length
        return @entry.split.count
    end
end