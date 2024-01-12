class LoginController < ApplicationController
    def show
    end

    validates :error_check
    def error_check
if login.present?
    end

    def login
    
        @teacher = Teacher.find_by(teacher_id: params[:teacher_id])

        if   @teacher.password == params[:password]
            # if @teacher.kanri
            #     if params[:kanri] == "true"
            #         redirect_to "/teachers/new"
            #     else
            #         redirect_to "/select/show"
            #     end
            # else
                if @teacher.classroom_id.present? #クラスＩＤをもっているか　
                    redirect_to attendance_list_show_path(@teacher.classroom_id)
                else
                    redirect_to "/select/show"
                end
            # end
        else 　
            render :show
        end
    end
end