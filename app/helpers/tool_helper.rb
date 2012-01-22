module ToolHelper

  
  def rating_stars(tool)
    render :partial => 'shared/tool_stars', :object => tool
  end
  
  def review_stars(review)
    render :partial => 'shared/review_stars', :object => review    
  end
end
