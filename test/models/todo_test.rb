require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  
  def setup
    @todo = Todo.new(name: "filling station", description: "Fill car up with fuel")
  end
  
  test "todo should be valid" do
    assert @todo.valid?
  end
  
  test "name should be present" do # todo.rb line:2  ensure you have the code "validates :name, presence: true" for this test to pass
    @todo.name = ""
    assert_not @todo.valid?
  end
  
  test "description should be present" do #todo.rb line:3  ensure you have the code "validates :description, presence: true" for this test to pass
    @todo.description = ""
    assert_not @todo.valid?
  end
  
  test "name shouldn’t be less than 5 characters" do #look at todo.rb line:2 "length: {minimum: 4}" to resolve
    @todo.name = "a" * 3
    assert_not @todo.valid?
  end
  
  test "description should not be more than 250 characters" do #look at todo.rb line:3 "length: {maximum: 250}" to resolve"
    @todo.description = "a" * 251
    assert_not @todo.valid?
  end
  
end