class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :notes, :title
  validates :title, :presence => true
end
