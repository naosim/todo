require 'src/Executor'

class Switcher < Executor
  def initialize()
    @exes = Array.new
  end

  def addExecutor(exe)
    @exes << exe
    exe.outputer = @outputer
    exe.argv = @argv
  end

  def outputer=(value)
    super(value)
    @exes.each{|exe|
      exe.outputer = value
    }
  end

  def argv=(value)
    super(value)
    @exes.each{|exe|
      exe.argv = value
    }
  end

  def getExecutor(methodName)
    @exes.each{|exe|
      return exe if exe.isKey?(methodName)
    }
    return nil
  end
  
  def run(tasks)
    getExecutor(@argv[0]).run(tasks)
  end
end