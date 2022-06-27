require 'task'

RSpec.describe Task do
    it "returns true if a task is marked as complete" do
        my_task = Task.new("Walk the dog")
        my_task.mark_complete
        result = my_task.complete?
        expect(result).to eq true
    end

    it "fails if #complete? is called on an incomplete task" do
        my_task = Task.new("Walk the dog")
        expect{ my_task.complete? }.to raise_error "Your task is not completed"
    end    
end