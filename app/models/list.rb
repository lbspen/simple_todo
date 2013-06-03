class List < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks, :dependent => :delete_all

  validates :name, :presence => true
end
