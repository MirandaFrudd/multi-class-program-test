class Task
    def initialize(task)
        @task = task
        @status = 'incomplete'
    end

    def mark_complete
        @status = 'complete'
    end

    def complete?
        if @status == 'complete'
            return true
        end

        fail "Your task is not completed" if @status == 'incomplete'
    end
end