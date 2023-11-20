class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :update, :destroy]

  def create
    contract = Contract.new(contract_params)
    if contract.save
      render json: contract, status: :created
    else
      render json: contract.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @contract
  end

  def update
    if @contract.update(update_contract_params)
      render json: @contract
    else
      render json: @contract.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @contract.destroy
    head :no_content
  end

  def archive
    file_path = ContractArchiveJob.perform_now(params[:file_path])
    if file_path
      send_file file_path, type: 'text/csv', disposition: 'attachment', filename: 'failed_contracts.csv'
    else
      head :ok
    end
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:user_id, :company_id, :average_weekly_hours, :hourly_wage, :valid_from, :valid_to)
  end

  def update_contract_params
    params.require(:contract).permit(:signed_date_user, :signed_date_company)
  end
end
