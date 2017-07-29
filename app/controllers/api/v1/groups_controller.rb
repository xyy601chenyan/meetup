class Api::V1::GroupsController < Api::V1::BaseController

  before_action :authenticate_user!, only: [:index]

  def index
    @groups = Group.all
  end

end
