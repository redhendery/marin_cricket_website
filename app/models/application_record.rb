# frozen_string_literal: true

# Active Record defaults for application
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
