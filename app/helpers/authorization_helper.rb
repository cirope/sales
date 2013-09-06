module AuthorizationHelper
  def salesman?
    current_user.kind_of? Salesman
  end
end
