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
  
  def admin_top_menu
    if user_signed_in?
      content_tag :div, :class => 'admin_top_menu' do
        "Hello, Admin.  " +
        link_to('Logout', destroy_user_session_path)
      end
    end
  end
end
