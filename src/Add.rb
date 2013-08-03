require 'src/Executor'
class Add < Executor
  def run(tasks)
    task = Task.new
    task.name = argv[1]
    tasks.push(task)
    puts @argv
  end
  
  def isKey?(key)
    return key == "add"
  end
end