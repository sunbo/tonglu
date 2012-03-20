class ExperiencesController < ApplicationController
   before_filter :login_required

#创建高中
   def createschool
    @school = current_user.schools.build
    name = params[:schoolname]
    schoolyear = params[:schoolyear]
   respond_to do |wants|
         if schoolyear != "毕业时间" && (!name.empty? && name != nil)
           @school.name = name
           @school.year = schoolyear
           @school.save
            wants.js do
              render :update do |page|
              page.insert_html :bottom, "school",:partial => 'experiences/school_create', :object => @school
              page.visual_effect :highlight, "school_#{@school.id}"
              page << "jq('#schoolname').val('');"
              page << "jq('#schoolyear').val('毕业时间');"
              page << "tb_remove()"
              #page << "location.reload()"
              end
            end
         else
            wants.js do
              if name.empty? || name == nil
                render :update do |page|
                    page.alert "请填写学校名称"
                  end
             elsif schoolyear == "毕业时间"
                render :update do |page|
                    page.alert "请填写毕业时间"
                  end
              end
            end
         end
      end
  end
#更新高中
   def updateschool
    school_id = params[:school_id]
    name = params["school_name_#{school_id}"]
    schoolyear = params["school_year_#{school_id}"]
   respond_to do |wants|
         if schoolyear != "毕业时间" && (!name.empty? && name != nil)
           @school = current_user.schools.find(school_id)
           @school.update_attributes(:name=>name,:year=>schoolyear)
            wants.js do
              render :update do |page|
              page.replace_html "s_#{@school.id}",:partial => 'experiences/school_edit', :object => @school
              page.visual_effect :highlight, "s_#{@school.id}"
              page << "jq('#school_name_#{@school.id}').val('#{@school.name}');"
              page << "jq('#school_year_#{@school.id}').val('#{@school.year}');"
              page << "tb_remove()"
              end
            end
         else
            wants.js do
              if name.empty? || name == nil
                render :update do |page|
                    page.alert "请填写学校名称"
                  end
             elsif schoolyear == "毕业时间"
                render :update do |page|
                    page.alert "请填写毕业时间"
                  end
              end
            end
         end
      end
  end
#创建大学
   def createeducation
    @education = current_user.educations.build
    name = params[:educationname]
    educationyear = params[:educationyear]
    professional = params[:educationprofessional]
    degree = params[:educationdegree]
   respond_to do |wants|
         if educationyear != "毕业时间" && (!name.empty? && name != nil)&& (!professional.empty? && professional != nil)&& (!degree.empty? && degree != nil)
           @education.name = name
           @education.year = educationyear
           @education.professional = professional
           @education.degree = degree
           @education.save
            wants.js do
              render :update do |page|
              page.insert_html :bottom, "education",:partial => 'experiences/education_create', :object => @education
              page.visual_effect :highlight, "education_#{@education.id}"
              page << "jq('#educationname,#educationprofessional,#educationdegree').val('');"
              page << "jq('#educationyear').val('毕业时间');"
              page << "tb_remove()"
              end
            end
         else
            wants.js do
              if name.empty? || name == nil
                render :update do |page|
                    page.alert "请填写学校名称"
                  end
             elsif educationyear == "毕业时间"
                render :update do |page|
                    page.alert "请填写毕业时间"
                  end
             elsif professional.empty? || professional == nil
                render :update do |page|
                    page.alert "请填写所学专业"
                  end
             elsif degree.empty? || degree == nil
                render :update do |page|
                    page.alert "请填写获得学历/学位"
                  end
              end
            end
         end
      end
  end
#更新大学
   def updateeducation
    education_id = params[:education_id]
    name = params["education_name_#{education_id}"]
    educationyear = params["education_year_#{education_id}"]
    professional = params["education_professional_#{education_id}"]
    degree = params["education_degree_#{education_id}"]
   respond_to do |wants|
         if educationyear != "毕业时间" && (!name.empty? && name != nil)&& (!professional.empty? && professional != nil)&& (!degree.empty? && degree != nil)
           @education = current_user.educations.find(education_id)
           @education.update_attributes(:name => name,:year=>educationyear,:professional=>professional,:degree=>degree)
            wants.js do
              render :update do |page|
              page.replace_html "e_#{@education.id}",:partial => 'experiences/education_edit', :object => @education
              page.visual_effect :highlight, "e_#{@education.id}"
              page << "jq('#education_name_#{@education.id}').val('#{@education.name}');"
              page << "jq('#education_professional_#{@education.id}').val('#{@education.professional}');"
              page << "jq('#education_degree_#{@education.id}').val('#{@education.degree}');"
              page << "jq('#education_year').val('#{@education.year}');"
              page << "tb_remove()"
              end
            end
         else
            wants.js do
              if name.empty? || name == nil
                render :update do |page|
                    page.alert "请填写学校名称"
                  end
             elsif educationyear == "毕业时间"
                render :update do |page|
                    page.alert "请填写毕业时间"
                  end
             elsif professional.empty? || professional == nil
                render :update do |page|
                    page.alert "请填写所学专业"
                  end
             elsif degree.empty? || degree == nil
                render :update do |page|
                    page.alert "请填写获得学历/学位"
                  end
              end
            end
         end
      end
  end
#创建工作
   def creatework
    @work = current_user.works.build
    name = params[:workname]
    position = params[:workposition]
    description = params[:workdescription]
    workspan = params[:workspan]
    startyear = params[:startyear]
    endyear = ""
    if workspan == nil
      endyear = params[:endyear]
    end
   respond_to do |wants|
         if startyear != "入职年份" && endyear != "离职年份" && (!name.empty? && name != nil)&& (!position.empty? && position != nil)&& (!description.empty? && description != nil)
                 @work.name = name
                 @work.position = position
                 @work.description = description
                 @work.startyear = startyear
                 @work.endyear = endyear if endyear != ""
                @work.workspan = workspan if workspan != nil
                 @work.save

                  wants.js do
                    render :update do |page|
                    page.insert_html :bottom, "work",:partial => 'experiences/work_create', :object => @work
                    page.visual_effect :highlight, "work_#{@work.id}"
                    page << "jq('#workname,#workposition,#workdescription,#workworkspan').val('');"
                    page << "jq('#startyear').val('入职年份');"
                      page << "jq('#endyear').val('离职年份');"
                    page << "tb_remove()"
                    end
                  end
         else
            wants.js do
              if name.empty? || name == nil
                render :update do |page|
                    page.alert "请填写公司名称"
                  end
             elsif position.empty? || position == nil
                render :update do |page|
                    page.alert "请填写所在职位"
                  end
             elsif description.empty? || description == nil
                render :update do |page|
                    page.alert "请填写工作描述"
                  end
             elsif startyear == "入职年份"
                render :update do |page|
                    page.alert "请填写入职年份"
                  end
             elsif workspan == nil
               if endyear == "离职年份"
                render :update do |page|
                    page.alert "请填写离职年份"
                  end
               end
              end
            end
         end
      end
  end
#更新工作
   def updatework
    work_id = params[:work_id]
    name = params["work_name_#{work_id}"]
    position =params["work_position_#{work_id}"]
    description = params["work_description_#{work_id}"]
    workspan = params[:work][:workspan]
    startyear = params["work_startyear_#{work_id}"]
    endyear = nil
    if workspan == nil
      endyear = params["work_endyear_#{work_id}"]
    end
   respond_to do |wants|
         if startyear != "入职年份" && endyear != "离职年份" && (!name.empty? && name != nil)&& (!position.empty? && position != nil)&& (!description.empty? && description != nil)
           @work = current_user.works.find(work_id)
           @work.update_attributes(:name=>name,:position=>position,:description=>description,:workspan=>workspan,:startyear=>startyear,:endyear=>endyear)
            wants.js do
              render :update do |page|
              page.replace_html "w_#{@work.id}",:partial => 'experiences/work_edit', :object => @work
              page.visual_effect :highlight, "w_#{@work.id}"
               page << "jq('#work_name_#{@work.id}').val('#{@work.name}');"
              page << "jq('#work_position_#{@work.id}').val('#{@work.position}');"
               page << "jq('#work_description_#{@work.id}').val('#{@work.description}');"
                page << "jq('#work_workspan').val('#{@work.workspan}');"
             page << "jq('#work_startyear_#{@work.id}').val('#{@work.startyear}');"
              page << "jq('#work_endyear_#{@work.id}').val('#{@work.endyear}');"
              page << "tb_remove()"
              end
            end
         else
            wants.js do
              if name.empty? || name == nil
                render :update do |page|
                    page.alert "请填写公司名称"
                  end
             elsif position.empty? || position == nil
                render :update do |page|
                    page.alert "请填写所在职位"
                  end
             elsif description.empty? || description == nil
                render :update do |page|
                    page.alert "请填写工作描述"
                  end
             elsif startyear == "入职年份"
                render :update do |page|
                    page.alert "请填写入职年份"
                  end
             elsif workspan == nil
               if endyear == "离职年份"
                render :update do |page|
                    page.alert "请填写离职年份"
                  end
               end
              end
            end
         end
      end
  end
#删除
    def destroy
      case params[:switch]
      when 'school'
      @school = current_user.schools.find(params[:id])
      @school.destroy
      when 'education'
      @education = current_user.educations.find(params[:id])
      @education.destroy
       when 'work'
      @work = current_user.works.find(params[:id])
      @work.destroy
      end
      flash[:notice] = "删除成功"
      redirect_to :controller => 'profile',:action => 'edit'

  end
end
