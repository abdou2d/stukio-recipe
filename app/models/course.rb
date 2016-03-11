class Course < ActiveRecord::Base
	has_many :chapters
	mount_uploader :thumbnail, ImageUploader
end

