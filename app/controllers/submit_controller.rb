class SubmitController < ApplicationController
  def create
    # Create hashs for the chainpoint with the Bagdet params
    param = { 'hashes' => [(Digest::SHA2.hexdigest params["Badget Issue Date"] + params["Badget Recipient Name"])] }.to_json
    respond = Net::HTTP.post(URI.parse('http://3.136.178.15/hashes'), param, "Content-Type" => "application/json")
    # Prepare parameters for the success submit page
    parsed_respond = ActiveSupport::JSON.decode(respond.body)
    badget_info = { "badget UUID" => params["Badget UUID"], "hash" => parsed_respond["hashes"].first["hash"], "hash id node" => parsed_respond["hashes"].first["proof_id"] }
    # Redirect to success page with the parameters require
    redirect_to success_path(badget_info)
  end
end
