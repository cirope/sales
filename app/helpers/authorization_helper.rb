module AuthorizationHelper
  def admin?
    current_user.kind_of? Admin
  end

  def salesman?
    current_user.kind_of? Salesman
  end
end
