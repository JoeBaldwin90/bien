ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :username, :email, :real_name, :password, :password_confirmation, :is_admin
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

# From stackoverflow "active user to_param override"
controller do
    resources_configuration[:self][:finder] = :find_by_username
end

end
