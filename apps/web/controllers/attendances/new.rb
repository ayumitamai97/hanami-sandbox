module Web
  module Controllers
    module Attendances
      class New
        include Web::Action

        def call(params)
          # TODO: ended_atがないattendanceがあったらとってきてended_atをうめる
        end
      end
    end
  end
end