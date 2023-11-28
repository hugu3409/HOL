class LoginController < ApplicationController
    def show
    end

    def login
    
        @teacher = Teacher.find_by(teacher_id: params[:teacher_id])

        if  @teacher.password = params[:password]
            if @teacher.classroom_id.present?
                redirect_to "/attendance_list/1"
            else
                redirect_to "/select/show"
            end
        else 　　
            render :show
        end
    end
end