class RemoteLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer
  def prepare(collection, options, template)
    @remote_url = options.delete(:remote_url) || {}
    super
  end  
  def url(page)
    "#{@remote_url}&page=#{page}"
  end  
  def link(text, target, attributes = {})
    if target.is_a? Fixnum
      attributes[:rel] = rel_value(target)
      target = url(target)
    end
    attributes[:href] = target
    attributes[:remote] = true
    attributes['data-remote'] = true
    tag(:a, text, attributes)
  end
end