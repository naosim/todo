require File.dirname(__FILE__) + '/Executor'
class Done < Executor
  def run(tasks)
    return if @argv.length < 2
    
    isDone = @argv[1] != "-cancel"
    index = @argv[isDone ? 1 : 2].to_i
    return if tasks.length - 1 < index 
    
    tasks[index].finishedDate = isDone ? Time.now.to_i : nil
  end
  
  def isKey?(key)
    return key == "do" || key == "done"
  end
end