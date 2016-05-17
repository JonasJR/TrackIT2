class MotivationsController < ActionController::Base

  def create
    
  end

  private

  def motivation_params
    params.require(:motivation).permit(:motivation)
  end

end
