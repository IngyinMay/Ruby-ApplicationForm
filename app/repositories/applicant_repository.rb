class ApplicantRepository
    class << self
        def create(applicant)
            @is_create = applicant.save
        end

    end
end