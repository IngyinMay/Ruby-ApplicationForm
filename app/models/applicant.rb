class Applicant < ApplicationRecord

  attribute :careers, :default => []
    # has_one_attached :profile_photo
    has_one_attached :profile_photo do |attachable|
        attachable.variant :thumb, resize: "100x100"
    end
    
    validates :name, presence: true,  length: { maximum: 100 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP, message: " should be email format." }
    validates :profile_photo, presence: true, attached: true,  blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], message: " is not valid image format" }
    validates :total_exp_year, length: { maximum: 3 }
    validates :dob, presence: true
    validates :phone_no1, presence: true, length: { maximum: 15 }, numericality: { only_integer: true }
    validates :phone_no2, length: { maximum: 30 }, allow_nil: true, allow_blank: true, numericality: { only_integer: true }
    validates :current_address, presence: true, length: { maximum: 255 }
    validates :hometown_address, length: { maximum: 255 }
    validates :university, presence: true, length: { maximum: 100 }
    validates :degree, presence: true, length: { maximum: 100 }
    validates :graduated_year, presence: true, length: { maximum: 20 }
    validates :certificate, length: { maximum: 255 }
    validates :has_job_exp, presence: true, length: { maximum: 1}
    validates :diploma_name, length: { maximum: 100 }
    validates :master_university, length: { maximum: 100 }
    validates :master_degree, length: { maximum: 100 }
    validates :master_graduated_year, length: { maximum: 20 }
end
