require 'src/TextOutputer'
require 'src/Task'
require 'src/List'

def loadTasks
  result = Array.new
  4.times {|i|
    task = Task.new
    task.name = "hoge_#{i}"
    result.push(task)
  }
  
  return result
end

outputer = TextOutputer.new
tasks = loadTasks()
# p tasks
exe = List.new
exe.outputer = outputer
exe.run(tasks)
