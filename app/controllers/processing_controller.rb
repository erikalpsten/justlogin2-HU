class ProcessingController < ApplicationController
  def step1
    session[:find_out_more] = params[:findoutmore]
    @benefits = Refinery::Products::Benefit.where(id: params[:findoutmore])
    redirect_to refinery.benefits_products_products_benefits_path(benefits: @benefits.map(&:friendly_id))
  end

  def step2
    session[:product_ids] = params[:product_ids]
    redirect_to '/contact'
  end

  # def step3
  #   if params[:confirmation] == 'yes'
  #     redirect_to '/contact'
  #   else
  #     redirect_to '/confirm'
  #   end
  # end

  def complete
    puts 'test'
    @products = Refinery::Products::Product.where(id: session[:product_ids])
    @user_submission = Refinery::Products::UserSubmission.new(user_submission_params)
    @user_submission.benefits = Refinery::Products::Benefit.where(id: session[:find_out_more])
    @user_submission.products = @products
    if @user_submission.save
      reset_session
      redirect_to '/complete'
    else
      render '/home/contact'
    end
  end

  private
  def user_submission_params
    params.require(:user_submission).permit([:first_name, :last_name, :email, :terms, :company, :phone_number, :other_inquiries])
  end
end
