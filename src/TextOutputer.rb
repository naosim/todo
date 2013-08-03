require File.dirname(__FILE__) + '/Outputer'

class TextOutputer < Outputer

  def output(str)
    print(str)
  end
end