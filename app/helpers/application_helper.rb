module ApplicationHelper
  def full_title(page_title)
    basic_title = 'RUNTEQ BOARD APP'
    if page_title.empty?
      basic_title
    else
      page_title + ' | ' + basic_title
    end
  end
end
