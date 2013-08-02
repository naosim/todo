require 'src/TextOutputer'
require 'src/Task'
require 'src/List'
require 'src/Switcher'

def loadTasks
  result = Array.new
  4.times {|i|
    task = Task.new
    task.name = "hoge_#{i}"
    result.push(task)
  }
  
  return result
end

tasks = loadTasks()

switcher = Switcher.new
switcher.argv = ARGV
switcher.outputer = TextOutputer.new
switcher.addExecutor(List.new)
switcher.run(tasks)
