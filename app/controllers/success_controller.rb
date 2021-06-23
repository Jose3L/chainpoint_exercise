class SuccessController < ApplicationController
  def index
    @badget_info = { "badget UUID" => params["badget UUID"], "hash" => params["hash"], "hash id node" => params["hash id node"] }
  end
end
