class ApplicationController
  include Pakyow::Helpers
  
  def index
    highlight
  end
  
  def manual
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
  
  protected
  
  def highlight
    presenter.view.find('div.ruby').each do |view|
      view.content = CodeRay.scan(view.content.strip.gsub(/&lt;|&gt;/) {|s| {'&lt;' => '<','&gt;' => '>'}[s]}, :ruby).div(:css => :class)
    end
  end
end
