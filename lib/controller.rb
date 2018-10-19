require 'gossip'
require 'view'

class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save
  end

  def index_gossips
    all_gossips = Gossip.all
    @view.index_gossips(all_gossips)
  end

  def destroy
    all_gossips = Gossip.all
    gossip_to_destroy = @view.destroy_gossip(all_gossips)
    if gossip_to_destroy == "zz"
      return
    else
      Gossip.destroy(gossip_to_destroy)
    end
  end
end