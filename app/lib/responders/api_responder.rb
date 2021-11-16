module ApiResponder
  protected

  def json_resource_errors
    {
      success: false,
      errors: resource.errors
    }
  end
end