require 'src/Executor'

class List < Executor
  def run(tasks)
    if !isKey?(@argv[0]) || @argv.length == 1
      showAll(tasks)
    elsif @argv[1] == "-s"
      showWithFilter(tasks, true);
      showWithFilter(tasks, false);
    end
  end

  def showAll(tasks)
    i = 0;

    tasks.each{|task|
      finished = task.isFinished? ? 'v' : ' ';
      outputer.output("#{finished} #{i}.#{task.name}\n")
      i += 1
    }
  end

  def showWithFilter(tasks, isDone)
    i = 0;
    tasks.each{|task|
      finished = task.isFinished? ? 'v' : ' ';
      outputer.output("#{finished} #{i}.#{task.name}\n") if task.isFinished? == isDone
      i += 1
    }
  end

  def isKey?(key)
    return key == "ls"
  end
end