module RestUtil
  def post resource_path, params, current_user
    Typhoeus.post(
        "#{AppConfig[:api_url]}/#{resource_path}",
        params: params)
  end

  def get resource_path, params, current_user
    Typhoeus.get(
        "#{AppConfig[:api_url]}/#{resource_path}/#{params[:id]}",
        params: params
    )
  end

  def post_with_body resource_path, body, current_user
    Typhoeus.post(
        "#{AppConfig[:api_url]}/#{resource_path}",
        body: body
    )
  end

  def put resource_path, params, current_user
    put_absolute "#{resource_path}/#{params[:id]}", params, current_user
  end

  def put_absolute absolute_url, params, current_user
    Typhoeus.put(
        "#{AppConfig[:api_url]}/#{absolute_url}",
        params: params
    )
  end

  def getAll resource_path, params, current_user
    Typhoeus.get(
        "#{AppConfig[:api_url]}/#{resource_path}",
        params: params
    )
  end

  def get_resource_by_email resource_path, current_user
    Typhoeus.get(
        "#{AppConfig[:api_url]}/#{resource_path}/#{current_user.email}")
  end

end