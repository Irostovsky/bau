# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def reset_float
    content_tag :div, '', :class => 'reset_float'
  end

  def single_line_container(options={}, &block)
    concat ( content_tag :div, :class => "single_line_container #{options[:class]}" do
    concat capture(&block)
    end)
    concat reset_float
  end

  def top_menu_data
    [
      {:name => :home, :path => home_index_path, :title => 'Главная'},
      {:name => :contacts, :path => contacts_path, :title => 'Контакты'},
      {:name => :galleries, :path => galleries_path, :title => 'Галерея'},
      {:name => :kits, :path => kits_path, :title => 'Снаряжение'}
    ]
  end
  
  def top_menu
    top_menu_data.map do |h|
      if @page == h[:name]
        content_tag(:span, h[:title], :class => 'current_page') 
      else
        link_to h[:title], h[:path] 
      end
    end
  end
  
  def bottom_menu
    top_menu_data.map do |h|
      link_to h[:title], h[:path] 
    end
  end
  
  def admin_top_menu
    for_admin do
      content_tag :div, :class => 'admin_top_menu' do
        "Hello, Admin.  " +
        link_to('Logout', destroy_user_session_path)
      end
    end
  end
    
  def for_admin(&block)
    if user_signed_in?
      yield
    end
  end
  
end
