module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Adelante"
    return base_title if page_title.empty?
    return "#{base_title} | #{page_title}"
  end

  def active_menu_check(menu_name)
    return (params[:controller] == menu_name) ? 'active' : ''
  end
end
