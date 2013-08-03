require File.dirname(__FILE__) + '/src/TextOutputer'
require File.dirname(__FILE__) + '/src/Task'
require File.dirname(__FILE__) + '/src/List'
require File.dirname(__FILE__) + '/src/Add'
require File.dirname(__FILE__) + '/src/Done'
require File.dirname(__FILE__) + '/src/Delete'
require File.dirname(__FILE__) + '/src/Switcher'

def createTask line
  task = Task.new
  elms = line.split(" ", 2)
  task.finishedDate = elms[0] == "-" ? nil : elms[0].to_i
  task.name = elms[1].strip
  return task
end

def loadTasks

  result = Array.new

  # 4.times {|i|
  # task = Task.new
  # task.name = "あいうえお_#{i}"
  # task.finishedDate = Time.now if i == 0
  # result.push(task)
  # }
  # return result

  open(File.dirname(__FILE__) + "/data.txt") {|file|
    while l = file.gets
      break if l.strip.length == 0
      
      task = createTask(l)
      
      # elms = l.split(" ", 2)
      # task.finishedDate = elms[0] == "-" ? nil : elms[0].to_i
      # task.name = elms[1].strip
      result.push(task)

    end
  } if File.exist?(File.dirname(__FILE__) + "/data.txt")

  return result
end

def saveTasks(tasks)
  File.open(File.dirname(__FILE__) + "/data.txt", "w"){|file|
    tasks.each{|task|
      date = task.isFinished? ? "0" : "-"
      line = "#{date} #{task.name}\n"
      file.write(line)
    }
  }
end

tasks = loadTasks()


switcher = Switcher.new
switcher.argv = ARGV
switcher.outputer = TextOutputer.new
switcher.addExecutor(List.new)
switcher.addExecutor(Add.new)
switcher.addExecutor(Done.new)
switcher.addExecutor(Delete.new)
switcher.run(tasks)

# listExecutor = List.new
# listExecutor.argv = ARGV
# listExecutor.outputer = TextOutputer.new
# listExecutor.run(tasks)


saveTasks(tasks)
