# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def top_menu
    [
      {:name => :home, :path => home_index_path, :title => 'Главная'},
      {:name => :contacts, :path => contacts_path, :title => 'Контакты'}
    ].map do |h|
      if @page == h[:name]
        content_tag(:span, h[:title], :class => 'current_page') 
      else
        link_to h[:title], h[:path] 
      end
    end
  end
end
