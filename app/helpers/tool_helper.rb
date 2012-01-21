module ToolHelper

  
  def rating_stars(tool)
    render :partial => 'shared/stars', :object => tool
  end
end
