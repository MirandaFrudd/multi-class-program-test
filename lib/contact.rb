class Contact
    attr_reader :name
    attr_reader :number

    def initialize(name, number)
        if valid?(number)
            @number = number
        else
            fail "Please check the phone number you are trying to add is correct"
        end
        @name = name
    end

    private

    def valid?(number)
        if number.length == 11 && number[0] == "0"
            return true
        end
    end
end