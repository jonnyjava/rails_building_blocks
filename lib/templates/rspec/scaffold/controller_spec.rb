require 'rails_helper'
<% module_namespacing do %>
describe <%= controller_class_name %>Controller do
  login_admin

  let(:<%= ns_file_name %>) { FactoryGirl.create(:<%= ns_file_name %>) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:<%= file_name %>) }
  let(:invalid_attributes) { { 'wrong_param' => 'wrong' } }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new <%= class_name %>' do
        expect { post :create, params: { <%= ns_file_name %>: valid_attributes } }.to change(<%= class_name %>, :count).by(1)
      end

      it 'redirects to the created <%= ns_file_name %>' do
        post :create, params: { <%= ns_file_name %>: valid_attributes }
        expect(response).to redirect_to(<%= class_name %>.last)
      end
    end
  end

  describe 'PUT #update' do
    let(:<%= table_name %>) { FactoryGirl.create(:<%= ns_file_name %>) }
    context 'with valid params' do
      let(:new_attributes) { FactoryGirl.attributes_for(:<%= file_name %>) }

      it 'redirects to the <%= ns_file_name %>' do
        put :update, params: { id: <%= file_name %>.to_param, <%= ns_file_name %>: valid_attributes }
        expect(response).to redirect_to(<%= file_name %>)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested <%= ns_file_name %>' do
      <%= file_name %> = FactoryGirl.create(:<%= ns_file_name %>)
      expect { delete :destroy, params: { id: <%= file_name %>.to_param } }.to change(<%= class_name %>, :count).by(-1)
    end

    it 'redirects to the <%= table_name %> list' do
      <%= file_name %> = FactoryGirl.create(:<%= ns_file_name %>)
      delete :destroy, params: { id: <%= file_name %>.to_param }
      expect(response).to redirect_to(<%= index_helper %>_url)
    end
  end
end
<% end %>
