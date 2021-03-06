require File.dirname(__FILE__) + '/Executor'

class List < Executor
  def run(tasks)
    if !isKey?(@argv[0]) || @argv.length == 1
      showAll(tasks)
    elsif @argv[1] == "-s"
      showWithFilter(tasks, false);
      outputer.output("\n")
      showWithFilter(tasks, true);
    elsif @argv[1] == "-todo"
      showWithFilter(tasks, false);
    elsif @argv[1] == "-done"
      showWithFilter(tasks, true);
    elsif @argv[1] == "-l"
      showDetail(tasks)
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
  
  def showDetail(tasks)
    i = 0;

    tasks.each{|task|
      finished = task.isFinished? ? 'v' : ' ';
      date = task.isFinished? ? Time.at(task.finishedDate) : "--- --- -- --:--:-- ----- ----"
      outputer.output("#{finished} #{date} #{i}.#{task.name}\n")
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