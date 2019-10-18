class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [ :created_at, :updated_at ] // same as line 4 above
    # render json: birds.to_json(except: [:created_at, :updated_at]) // also same as line 4, w/o the rails magic
  end

  def show
    bird = Bird.find_by(id: params[:id])
    render json: { id: bird.id, name: bird.name, species: bird.species }
    # render json: bird.slice(:id, :name, :species) // same as line above, just another way of writing it
  end

# same show method as above, but renders message 'bird not found' if :id returns nil
  def show
    bird = Bird.find_by(id: params[:id])
    if bird 
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else  
      render json: { message: 'Bird not found' }
    end
  end


end 
