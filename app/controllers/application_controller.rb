class ApplicationController < ActionController::API
  include ErrorHandler

  private

  def render_collection(collection, serializer: nil, root: nil)
    root_key = root || collection.model_name.plural

    render json: {
      root_key => ActiveModelSerializers::SerializableResource.new(collection, each_serializer: serializer).as_json,
      meta: pagination_meta(collection)
    }
  end

  def pagination_meta(collection)
    {
      page: collection.current_page,
      per_page: collection.limit_value,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end

  def per_page
    [[params[:per_page].to_i, 1].max, 100].min || 10
  end
end
