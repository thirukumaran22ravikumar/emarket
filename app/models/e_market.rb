class EMarket < ActiveRecord::Base
	mount_uploader :image, ProductUploader
end
