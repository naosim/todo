require 'src/Executor'
class List < Executor
  def run(tasks)
    i = 0;
    tasks.each{|task|
      finished = task.isFinished? ? 'v' : ' ';
      outputer.output("#{finished} #{i}.#{task.name}\n")
      i += 1
    }
  end
  
  def isKey?(key)
    return key == "ls"
  end
end