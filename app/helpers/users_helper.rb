module UsersHelper
  def user_types
    [
      [t('users.form.types.salesman'), 'Salesman'],
      [t('users.form.types.admin'), 'Admin']
    ]
  end
end
