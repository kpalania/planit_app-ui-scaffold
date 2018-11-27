module BaseUtil

  def stringify_modified_on modified_on
    modified_on.to_time.strftime("%m/%d/%Y %H:%M %p")
  end

end