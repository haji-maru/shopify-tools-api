class Api::V1::CalculatorSettingsController < ApplicationController
  # 設定値を取得
  def index
    # 最初の1件を取得する（設定値は1件だけ保存する想定）
    setting = CalculatorSetting.first

    if setting
      # 設定値が存在する場合はJSONで返す
      render json: setting
    else
      # 設定値が存在しない場合は空のJSONを返す
      render json: {}
    end
  end

  # 設定値を新規保存
  def create
    setting = CalculatorSetting.new(calculator_setting_params)

    if setting.save
      # 保存に成功した場合は保存した設定値をJSONで返す
      render json: setting, status: :created
    else
      # 保存に失敗した場合はエラーをJSONで返す
      render json: { errors: setting.errors }, status: :unprocessable_entity
    end
  end

  # 設定値を更新
  def update
    setting = CalculatorSetting.find(params[:id])

    if setting.update(calculator_setting_params)
      render json: setting
    else
      render json: { errors: setting.errors }, status: :unprocessable_entity
    end
  end

  private
  def calculator_setting_params
    params.require(:calculator_setting).permit(
      :cost,
      :margin,
      :fee_rate,
      :rounding_method
    )
  end
end
