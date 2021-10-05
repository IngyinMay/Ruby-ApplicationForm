

$('.add-phone').click();
$('.add-phone').click(function() {
    if ($('.ph-block').length < 2) {
        $( '<div class="ph-div"><input class="ph-block form-control col-sm-2" type="text" name="applicant[phone_no2]" id="applicant_phone_no2">'+ 
           '<span class="btn btn-danger remove-phone" role="button">x</span></div>' ).insertAfter( ".ph-div" );
    }
});

$('.remove-phone').click(function () {
    $('.remove-phone').parent().remove();
});

$('#applicant_has_job_exp').on('change', function() {
    if ($(this).prop('checked')) {
        $('.job-sub-div').removeAttr("hidden");
    } else {
        $('.job-sub-div').attr("hidden", true)
    }
});

$(document).ready(function() {
    if ($('#applicant_has_job_exp').prop('checked')) {
        $('.job-sub-div').removeAttr("hidden");
    }
});

$('.lang-add-btn').on('click', function () {
    console.log(' hello');
    if ($('.lang-div').length < 5) {
        $(".career_skill_div").append('<div class="lang-div"><input class="form-control w24 career_lang" type="text" id="applicant_language" name="career_lang_1"> '+ 
        '<input class="form-control w24 career_level" type="text" id="applicant_level" name="career_level_1"></div>');
    }
});

$('form').submit(function () {
    var career_skills = '';
    var language_siklls = '';
    $( ".lang-div" ).each(function(i) {
        language = $(this).find('.career_lang').val();
        level = $(this).find('.career_level').val();
        if (language != null && language != '' && level != null && level != '') {
            career_skills = i == 0 ? (language + ':' + level) : (career_skills + ',' +language +':' + level);
        }
    });
    $("#applicant_career_skills").val(career_skills );
    language_siklls = '{"english_lang":"' + $("#applicant_english").val() + '","japan_lang":"' + $("#applicant_japan").val() + '","other_lang":"' + $("#applicant_other_language").val() + '"}';
    $("#applicant_language_skills").val(language_siklls);
});

document.addEventListener("direct-upload:initialize", event => {
    console.log('direct upload start');
    const { target, detail } = event
    const { id, file } = detail
    target.insertAdjacentHTML("beforebegin", `
      <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
        <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
        <span class="direct-upload__filename"></span>
      </div>
    `)
    target.previousElementSibling.querySelector(`.direct-upload__filename`).textContent = file.name
  })
  
  addEventListener("direct-upload:start", event => {
    console.log('direct upload starsst');
    const { id } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.remove("direct-upload--pending")
  })
  
  addEventListener("direct-upload:progress", event => {
    console.log('direct upload stsssart');
    const { id, progress } = event.detail
    const progressElement = document.getElementById(`direct-upload-progress-${id}`)
    progressElement.style.width = `${progress}%`
  })
  
  addEventListener("direct-upload:error", event => {
    console.log('direct upload startddd');
    event.preventDefault()
    const { id, error } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--error")
    element.setAttribute("title", error)
  })
  
  addEventListener("direct-upload:end", event => {
    console.log('direct upload stasdsdsrt');
    const { id } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--complete")
  })