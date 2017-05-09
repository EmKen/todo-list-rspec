require "rspec"

require_relative "list"
require_relative "task"


describe List do
  
  let(:title) { "My todo list" }
  let(:list) { List.new(title) }
  let(:task_a) { Task.new("Buy groceries") }
  let(:task_b) { Task.new("Wash car") }

  describe "#initialize" do
  	it "takes a title as it's first argument" do
  		expect(List.new("Todo List")).to be_a_kind_of(List)
  	end

  	it "requires at least one argument" do
  		expect {List.new}.to raise_error(ArgumentError)
  	end
  end

  describe "#add_task" do
  	it "requires one argument" do
  		expect{list.add_task}.to raise_error(ArgumentError)
  	end

  	it "adds given task to list" do
  		expect(list.tasks).to eq([])
  		list.add_task(task_a)
  		expect(list.tasks.size).to eq(1)
  		expect(list.tasks[0]).to eq(task_a)
  	end
  end

  describe "#complete_task" do
  	it "changes task at given index from incomplete to complete" do
  		list.add_task(task_a)
  		expect(list.tasks[0].complete?).to eq(false)
  		list.complete_task(0)
  		expect(list.tasks[0].complete?).to eq(true)
  	end

  	it "ignores out of range indexes" do
  		list.complete_task(1)
  	end

  end

  describe "#delete_task" do
  	it "deletes task at given index" do
  		list.add_task(task_a)
  		expect(list.tasks.size).to eq(1)
  		list.delete_task(0)
  		expect(list.tasks.size).to eq(0)
  	end

  	it "ignores out of range indexes" do
  		list.delete_task(1)
  	end

  end

  describe "#completed_tasks" do
  	it "returns array of completed tasks" do
	  	list.add_task(task_a)
	  	list.add_task(task_b)
	  	list.complete_task(0)
	  	expect(list.completed_tasks.size).to eq(1)
	  	expect(list.completed_tasks[0]).to eq(task_a)
	  end
	end

	  describe "#incomplete_tasks" do
  	it "returns array of incomplete tasks" do
	  	list.add_task(task_a)
	  	list.add_task(task_b)
	  	list.complete_task(0)
	  	expect(list.incomplete_tasks.size).to eq(1)
	  	expect(list.incomplete_tasks[0]).to eq(task_b)
	  end
	end

end