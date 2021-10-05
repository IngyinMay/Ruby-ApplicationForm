class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new
  end

  def confirm
    @applicant = Applicant.new(applicant_params)
    @applicant.careers = params[:applicant][:careers]
    if (!@applicant.valid?)
      render :new
    else
      applicant_obj = @applicant.attributes
      applicant_obj["profile_photo_path"] = url_for(@applicant.profile_photo)
      applicant_obj["profile_photo"] = @applicant.profile_photo.signed_id 
      applicant_obj["career_skill_text"] = @applicant.career_skills.gsub(",", "\n")
      applicant_obj["lang_skill_text"] = @applicant.language_skills.gsub(",", "\n")
      session[:applicant] = applicant_obj
      render :showConfirm
    end
  end

  def showConfirm
    if (session[:applicant] == nil)
      redirect_to root_path
    end
  end

  def create
    params = applicant_params
    params["profile_photo"] = session[:applicant]["profile_photo"]
    @applicant = Applicant.new(params)
    @is_create = ApplicantService.create(@applicant)
    if (@is_create)
      reset_session
      render html: '<h2 style="text-align:center; margin-top:15px;">You Are Successfully! Thank U</h2>'.html_safe
    else
      render :new
    end
  end

  private
  def applicant_params
    params.require(:applicant).permit(:name, :email, :profile_photo, :total_exp_year, :dob, :phone_no1, :phone_no2, :current_address, :hometown_address, 
                                      :university, :degree, :graduated_year, :certificate, :internship_info, :has_job_exp, :language_skills, :career_skills, 
                                      :diploma_name, :master_university, :master_degree, :master_graduated_year, :job_experiences)
  end
end
