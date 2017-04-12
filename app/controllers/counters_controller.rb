class CountersController < ApplicationController

  def show
    counter_data =  Faraday.get("https://counter-as-a-service.herokuapp.com/#{params["id"]}").body
    @value = JSON.parse(counter_data)["value"]
  end

  def update
    Faraday.put("https://counter-as-a-service.herokuapp.com/#{params["id"]}/#{params["type"]}")

    # Uncomment this line to do the update asynchronously
    # UpdateCounterWorker.perform_asynch(params["id"], params["type"])
    # UpdateCounterWorker.new.perform(params["id"], params["type"])

    redirect_to counter_path(params["id"])
  end
end
