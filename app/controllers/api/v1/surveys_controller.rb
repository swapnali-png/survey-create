module Api
  module V1
    class SurveysController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        @survey = Survey.new(survey_params)
        if @survey.save
          render json: { status: 'SUCCESS', message: 'Survey created', data: @survey }, status: :created
        else
          render json: { status: 'ERROR', message: 'Survey not created', data: @survey.errors }, status: :unprocessable_entity
        end
      end

      def index
        @surveys = Survey.all
         render json: @surveys, status: :ok
        # render json: { status: 'SUCCESS', message: 'Loaded all surveys', data: @surveys }, status: :ok
      end

      def update
        @survey = Survey.find(params[:id])
        if @survey.update(survey_params)
          render json: { status: 'SUCCESS', message: 'Survey updated', data: @survey }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Survey not updated', data: @survey.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def survey_params
        params.require(:survey).permit(:name, :description, survey_detail_attributes: [:id, :coordinates])
      end
    end
  end
end
