module ToolHelper

  def rating_stars(tool)
    render :partial => 'shared/tool_stars', :object => tool
  end
  
  def review_stars(review)
    render :partial => 'shared/review_stars', :object => review    
  end
  
  def ranking_text(num)
    if num == 0
      return t :ns, :scope=>[:reviews,:questions]
    elsif num == 1
      return t :lo, :scope=>[:reviews,:questions]
    elsif num ==2
      return t :hi, :scope=>[:reviews,:questions]
    end
  end
end
