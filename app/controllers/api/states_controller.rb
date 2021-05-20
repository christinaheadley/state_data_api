class Api::StatesController < ApplicationController

  def index
    @states = State.all
    render "index.json.jb"
  end

  def show
    state_id = params[:code]
    @state = State.find_by(code: state_id)
    # @states = State.find_by(code: params[:code])
    render "show.json.jb"
  end
end
