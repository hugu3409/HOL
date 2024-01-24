class LoginController < ApplicationController
    def show
    end

    def login
        if  params[:teacher_id].blank?
            flash[:alert] = 'ＩＤかＰＷが間違っています。入力し直してください。'
            render :show
            return
        end

        if  params[:password].blank?
            flash[:alert] = 'ＩＤかＰＷが間違っています。入力し直してください。'
            render :show
            return
        end

        @teacher = Teacher.find_by(teacher_id: params[:teacher_id])

        if  @teacher && @teacher.password == params[:password]
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
            flash[:alert] = 'ＩＤかＰＷが間違っています。入力し直してください。'
            render :show
            return
        end
    end
end