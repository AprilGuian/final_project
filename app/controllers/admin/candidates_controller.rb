module Admin
  class CandidatesController < ApplicationController
    before_action :authenticate_user!
    def index
      @candidates = Candidate.all
      @positions = Position.all
      render "admin/candidates/index.html.erb"
    end

    def new
      @candidate = Candidate.new
      render "admin/candidates/new.html.erb"
    end

    def edit
      @candidate = Candidate.find(params[:id])
    end

    def update
      @candidate = Candidate.find(params[:id])

      if @candidate.update(candidate_params())
        redirect_to admin_candidates_path(@candidate.id)
      else
        render "admin/candidates/edit.html.erb"
      end
    end

    def destroy
      @candidate = Candidate.find(params[:id])
      
      @candidate.votes.each do |v|
        v.destroy!
      end
      @candidate.destroy!
      redirect_to admin_candidates_path
    end

    def create
      @candidate = Candidate.new(candidate_params())

      if @candidate.save
        redirect_to admin_candidate_path(@candidate.id)
      else
        render "admin/candidates/new.html.erb"
      end
    end

    def show
      @candidate = Candidate.find(params[:id])
      render "admin/candidates/show.html.erb"
    end


    def candidate_params
      params.require(:candidate).permit!
    end
    
  end
end