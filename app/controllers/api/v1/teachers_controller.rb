module Api
  module V1
    class TeachersController < V1Controller
      before_action :set_teacher, only: %i(show update destroy)

      # GET /teachers
      # GET /teachers.json
      def index
        @teachers = Teacher.all
      end

      # GET /teachers/1
      # GET /teachers/1.json
      def show
      end

      # POST /teachers
      # POST /teachers.json
      def create
        @teacher = Teacher.create!(teacher_params)
      end

      # PATCH/PUT /teachers/1
      # PATCH/PUT /teachers/1.json
      def update
        @teacher.update!(teacher_params)
      end

      # DELETE /teachers/1
      # DELETE /teachers/1.json
      def destroy
        @teacher.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_teacher
        @teacher = Teacher.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list
      # through.
      def teacher_params
        params.permit(:name)
      end
    end
  end
end
