module Api
  module V1
    class OrganisationsController < ApplicationController
      def index
        organisations = Organisation.order('id ASC')
        render json: { status: 'SUCCESS', message: 'Loaded Organisations', data: organisations }, status: :ok
      end

      def show
        organisation = Organisation.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded Organisations', data: organisation }, status: :ok
      end

      def create
        organisation = Organisation.new(ppon_id: generate_specific_ppon_id(Organisation.count + 1))
        if organisation.save
          render json:[ identifiers:
            {
            "id": organisation.ppon_id,
            "id-type": "PPON_ID",
            "persisted": true
            }
            ], status: :ok
        else
          render json: { status: 'ERROR', message: 'Organisation not saved', data: organisation.errors }, status: :unprocessable_entity
        end
      end

      private

      def organisation_params
        params.permit(:id)
      end

      def generate_specific_ppon_id(index)
        result = `python3 ppon_id_script.py #{index} 2>&1`
        Rails.logger.debug { "Generating PPON ID, at index: #{index}:  #{result}" }
        result.to_s
      end
    end
  end
end
