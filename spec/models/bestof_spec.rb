require "rails_helper"

describe Bestof do 
	it { should validate_presence_of (:image_url)}

	it { should belong_to(:user) }

end 