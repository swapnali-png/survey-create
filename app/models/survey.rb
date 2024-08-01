class Survey < ApplicationRecord
	has_one :survey_detail, dependent: :destroy
  accepts_nested_attributes_for :survey_detail
end
