class Api::V2::ApiModelsController < Api::V2Controller
  respond_to :json

  def search
    temp_key = params[:api_key]
    params[:api_key] = "HtT8l0Hz7urpLQbb4nPI-eZU"
    query_params = params.except(:api,  :version_number, :controller, :action, :format).to_query
    url = "#{versioned_api_prefix}/search?#{query_params}"
    # binding.pry
    response = Net::HTTP.get(URI.parse(url))
    params[:api_key] = temp_key
    # binding.pry
    respond_with response
  end

  def show
    url = "#{versioned_api_prefix}/#{params['id']}"
    response = Net::HTTP.get(URI.parse(url))
    respond_with response
  end
end
