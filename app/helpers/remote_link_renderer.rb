class RemoteLinkRenderer < WillPaginate::LinkRenderer
  def prepare(collection, options, template)
    @remote = options.delete(:remote) || {}
    @spin = options.delete(:spin)
    super
  end

protected
  def page_link(page, text, attributes = {})
    @template.link_to_remote(text, {:url => url_for(page), :method => :get, :loading => (@spin ? "$('##{@spin}').spin();" : "")}.merge(@remote))
  end
end