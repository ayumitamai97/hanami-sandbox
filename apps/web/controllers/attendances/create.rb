module Web
  module Controllers
    module Attendances
      class Create
        include Web::Action

        def call(params)
          AttendanceRepository.new.record_time(
            user_id: params.get(:attendance, :user_id),
            timestamp: params.get(:attendance, :timestamp).nil? ? nil : Time.parse(params.get(:attendance, :timestamp))
          )

          redirect_to '/attendances'
        end
      end
    end
  end
end

# Railsだったら

#module Web ...とかもしないはず
# class AttendancesController < ApplicationController # <= ActionController::Baseを継承したクラス
#   def new
#     @attendance = Attendance.new
#   end
#
#   # 綺麗にRESTfulなアクションを作りづらい
#   # def complete; end, def approve; end とか時々見ますよね
#   def stamp_attendance
#     # strong parameter as private method
#     # ↑の定義の仕方によって色々処理変わりそうだが
#     @attendance = Attendance.new(attendance_params)
#
#     if @attendance.save
#       redirect_to attendances_path, flash: { success: t('.created') }
#     else
#       render :new, flash: { danger: t('.failed') }
#     end
#   end
#
#   def stamp_leave
#     @attendance = Attendance.find(params[:id])
#     @attendance.assign_attributes(
#       ended_at: Time.zone.now,
#       approved_at: nil
#     )
#
#     if @attendance.save
#       redirect_to attendances_path, flash: { success: t('.updated') }
#     else
#       render :new, flash: { danger: t('.failed') }
#     end
#   end
# end
