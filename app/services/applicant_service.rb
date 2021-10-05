class ApplicantService
    class << self
        def create(applicant)
            @is_create = ApplicantRepository.create(applicant)
        end
    end
end