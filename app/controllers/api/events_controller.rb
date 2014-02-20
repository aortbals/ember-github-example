class Api::EventsController < Api::BaseController
  def index
    return org_not_found unless org
    render json: events
  end

  private

  def events
    org.rels[:events].get.data
  end

  def org_not_found
    render json: { error: "There was no organization by that name" }, status: 404
  end

  def org
    @org ||= begin
      Octokit.org(params[:org_id] || params[:org])
    rescue Octokit::NotFound
      return
    end
  end
end
