# frozen_string_literal: true

class ComplaintsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_complaint, only: %i[show update]

  def index
    @complaints = complaint_query
  end

  def show; end

  def create
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user
    if @complaint.save!
      render json: @complaint
    else
      render @complaint.errors
    end
  end

  def update
    if @complaint.update(complaint_params)
      render json: @complaint
    else
      render @complaint.errors
    end
  end

  private

  def find_complaint
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:title, :description, location_point: %i[lat lng])
  end

  def complaint_query
    complaints = Complaint
    
    if params[:search].present?
      search_params = params[:search].split(' ').join('%')
      complaints = complaints.where('description ilike ?', "%#{search_params}%")
    end
    
    complaints.page(params[:page]).per(params[:per_page])
  end
end
