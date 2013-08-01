require 'src/Outputer'

class TextOutputer < Outputer

  def output(str)
    print(str)
  end
end