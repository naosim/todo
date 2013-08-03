require File.dirname(__FILE__) + '/Executor'
class Delete < Executor
  def run(tasks)
    if @argv[1] == "-done"
      deleteDone(tasks)
    else    
      tasks.delete_at(@argv[1].to_i)
    end
  end
  
  def deleteDone(tasks) 
    tasks.delete_if{|task|
        task.isFinished?
      }
  end
  
  def isKey?(key)
    return key == "del"
  end
end