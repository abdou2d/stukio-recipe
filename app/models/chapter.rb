class Chapter < ActiveRecord::Base
	belongs_to :course
	acts_as_readable :on => :created_at
end
