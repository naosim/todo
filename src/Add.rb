require 'src/Executor'

class Add < Executor
  def run(tasks)
    if@argv[1] == "-i"
      index = @argv[2].to_i
      taskName = @argv[3]
      task = Task.new
    task.name = taskName
    tasks.insert(index, task)
    else
      taskName = @argv[1]

      task = Task.new
    task.name = taskName
    tasks.push(task)
    end

  end

  def isKey?(key)
    return key == "add"
  end
end