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
      {:name => :description, :path => 'http://npblukraine.com/index.php/regions/donezk', :title => 'NPBL Донецк'},
      {:name => :home, :path => home_index_path, :title => 'Академия'},
      {:name => :education, :path => education_index_path, :title => 'Обучение'},
      {:name => :service, :path => service_index_path, :title => 'Услуги'},
      {:name => :kits, :path => kits_path, :title => 'Снаряжение'},
      {:name => :galleries, :path => cross_gallery_index_path, :title => 'Галерея'},
      {:name => :events, :path => events_path, :title => 'Новости'},
      {:name => :contacts, :path => contacts_path, :title => 'Контакты'}
    ]
  end
  
  def top_menu
    top_menu_data.map do |h|
      if @page == h[:name]
        content_tag(:span, h[:title], :class => 'current_page') 
      else
        popup = h[:name] == :description
        link_to h[:title], h[:path], :popup => popup 
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

  def date_format(date)
   date.strftime("%d.%m.%Y") if date
  end

  def textilize text
    RedCloth.new(text).to_html
  end
  
end
