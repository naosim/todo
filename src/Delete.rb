require 'src/Executor'
class Delete < Executor
  def run(tasks)
    tasks.delete_at(@argv[1].to_i)
  end
  
  def isKey?(key)
    return key == "del"
  end
end