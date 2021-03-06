class InfomationsController < ApplicationController
  before_action :authenticate_admin!,except: [:new,:thanks,:create]

  def new
    @infomation= Infomation.new
  end

  def thanks
  end

  def create
    @infomation= Infomation.new(infomation_params)
    if @infomation.save
      redirect_to thanks_infomations_path
    else
      flash[:infomation_notice] = "全ての項目を正しく入力してください"
      render "new"
    end
  end

  def index
    @infomations= Infomation.order(status: "ASC").page(params[:page]).per(6)
  end

  def show
    @infomation= Infomation.find(params[:id])
  end

  def update
    infomation= Infomation.find(params[:id])
    infomation.update(infomation_params)
    redirect_to infomations_path
  end

  private
  def infomation_params
    params.require(:infomation).permit(:name,:telephone_number,:email,:content,:genre,:status)
  end
end
