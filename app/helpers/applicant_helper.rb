module ApplicantHelper
    def old_or_session(attr, default = nil)
        if (((attr.include? "career_lang") || (attr.include? "career_level")))
            if @applicant.career_skills.present?
                career_skill_arr = @applicant.career_skills.split(',')
            elsif session[:applicant].present? && session[:applicant]['career_skills'].present?
                career_skill_arr = session[:applicant]['career_skills'].split(',')
            else
                return nil
            end
            index = attr[-1,1]
            type = (attr.include? "lang") ? "language" : "level"
            skill = career_skill_arr[index.to_i].split(':')
            return type == "language" ? skill[0] : skill[1]
        end
        if ((attr == "english_lang" || attr == "japan_lang" || attr == "other_lang"))
            if @applicant.language_skills.present?
                language_skills_arr = JSON.parse(@applicant.language_skills)
            elsif session[:applicant].present? && session[:applicant]['language_skills'].present?
                language_skills_arr = JSON.parse(session[:applicant]['language_skills'])
            else 
                return nil
            end
            return language_skills_arr[attr]
        end
        return (@applicant.present? && @applicant.read_attribute(attr).present?) ? @applicant.read_attribute(attr) : (session[:applicant].present? ? session[:applicant][attr] : default)
    end
end
