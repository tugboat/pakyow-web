class ApplicationController
  include Pakyow::Helpers
  
  def index
    highlight
    presenter.view.find('#nav-overview a').add_class('active')
  end
  
  def manual
    presenter.view.find('#nav-manual a').add_class('active')
    
    presenter.view.title = 'Pakyow: Manual'
    presenter.view.find('#toc').content = RDiscount.new(File.open('manual/_toc.markdown').read).to_html
    
    paths = []
    DirUtils.walk_dir('manual') do |path|
      next unless file = path.split('/')[1]
      next     if file == '_toc.markdown'
      
      paths << path
    end
    
    manual = ''
    paths.sort.each do |path|
      manual << RDiscount.new(File.open(path).read).to_html
    end
    
    presenter.view.find('#manual').content = manual
    
    highlight
  end
  
  def community
    presenter.view.find('#nav-community a').add_class('active')
  end
  
  protected
  
  def highlight
    presenter.view.find('div.code').each do |view|
      view.content = Pygments.highlight(view.content.strip.gsub(/&lt;|&gt;/) {|s| {'&lt;' => '<','&gt;' => '>'}[s]}, :lexer => view.attributes.class.gsub('code', '').strip)
    end
  end
end
