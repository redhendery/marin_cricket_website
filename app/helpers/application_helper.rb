# frozen_string_literal: true

# Helper methods available application wide
module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Marin Cricket Club'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
