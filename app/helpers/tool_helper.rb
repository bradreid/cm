module ToolHelper

  
  def rating_stars(tool)
    render :partial => 'shared/tool_stars', :object => tool
  end
  
  def review_stars(review)
    render :partial => 'shared/review_stars', :object => review    
  end
  
  def ranking_text(num)
    if num == 0
      return 'Not Stated'
    elsif num == 1
      return 'Low'
    elsif num ==2
      return 'High'
    end
  end
end
