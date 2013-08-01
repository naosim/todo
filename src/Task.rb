class Task
  attr_accessor(:name, :finishedDate)
  def isFinished?
    return !@finishedDate.nil?
  end
end
