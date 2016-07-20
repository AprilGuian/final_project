module Admin
  class PositionsController < ApplicationController
    before_action :authenticate_user!
    def index

      @positions = Position.all
      render "admin/positions/index.html.erb"
    end

    def new
      @position = Position.new
      render "admin/positions/new.html.erb"
    end

    def edit
      @position = Position.find(params[:id])
    end

    def update
      @position = Position.find(params[:id])

      if @position.update(position_params())
        redirect_to admin_positions_path(@position.id), notice: 'Success!'
      else
        render "admin/position/edit.html.erb"
      end
    end

    def destroy
      @candidate = Position.find(params[:id])
      @candidate.destroy!
      redirect_to admin_positions_path, notice: 'Position and its candidates are deleted!'
    end

    def create
      @position = Position.new(position_params())

      if @position.save
        redirect_to admin_position_path(@position.id), notice: 'Success!'
      else
        render "admin/positions/new.html.erb"
      end
    end

    def show
      @candidates = Candidate.all
      @position = Position.find(params[:id])
      render "admin/positions/show.html.erb"
    end


    def position_params
      params.require(:position).permit!
    end
  end
end