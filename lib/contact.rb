class Contact
    def initialize(name, number)
        @name = name
        @number = number
    end

    def add
        return "#{@name} - #{@number}"
    end
end