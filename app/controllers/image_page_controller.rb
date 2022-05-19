class ImagePageController < ApplicationController
 
  def index
    set_params
  end


  def params_permit
    params.permit(:id,:id_aux)
  end

  def set_params
    begin
      flickr = Flickr.new ENV['pusher_key'], ENV['pusher_secret']
      unless params[:id].blank?
        @photos = flickr.people.getPublicPhotos(user_id: params[:id])
        @id_aux = params[:id]
        p "id good"
      else
        unless params[:id_aux].blank?
            @photos = flickr.people.getPublicPhotos(user_id: params[:id_aux])
            @id_aux = params[:id_aux]
        else
          @photos = flickr.people.getPublicPhotos(user_id: ENV['pusher_app_id'])
          @id_aux = ENV['pusher_app_id']
        end
      end
      
    rescue StandardError => e
      p "rescue"
      flash[:alert] = "#{e.class}: #{e.message}. Please try again..."
      @photos = flickr.people.getPublicPhotos(user_id: params[:id_aux])
      @id_aux = params[:id_aux]
    end
    p "Variables"
    p params[:id_aux]  
    p @id_aux 
  end
end
