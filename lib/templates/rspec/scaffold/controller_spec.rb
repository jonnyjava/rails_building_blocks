require 'rails_helper'
<% module_namespacing do %>
describe <%= controller_class_name %>Controller do
  login_admin

  let(:<%= ns_file_name %>) { FactoryGirl.create(:<%= ns_file_name %>) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:<%= file_name %>) }
  let(:invalid_attributes) { { 'wrong_param' => 'wrong' } }
<% unless options[:singleton] %>
  describe 'GET #index' do
    it 'assigns all <%= table_name.pluralize %> as @<%= table_name.pluralize %>' do
      get :index, {}
      expect(assigns(:<%= table_name %>)).to eq(<%= table_name.singularize.camelize %>.all)
    end
  end
<% end %>
  describe 'GET #show' do
    it 'assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>' do
      get :show, id: <%= file_name %>.to_param
      expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe 'GET #new' do
    it 'assigns a new <%= ns_file_name %> as @<%= ns_file_name %>' do
      get :new, {}
      expect(assigns(:<%= ns_file_name %>)).to be_a_new(<%= class_name %>)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>' do
      get :edit, id: <%= file_name %>.to_param
      expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new <%= class_name %>' do
        expect { post :create, <%= ns_file_name %>: valid_attributes }.to change(<%= class_name %>, :count).by(1)
      end

      it 'assigns a newly created <%= ns_file_name %> as @<%= ns_file_name %>' do
        post :create, <%= ns_file_name %>: valid_attributes
        expect(assigns(:<%= ns_file_name %>)).to be_a(<%= class_name %>)
        expect(assigns(:<%= ns_file_name %>)).to be_persisted
      end

      it 'redirects to the created <%= ns_file_name %>' do
        post :create, <%= ns_file_name %>: valid_attributes
        expect(response).to redirect_to(<%= class_name %>.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved <%= ns_file_name %> as @<%= ns_file_name %>' do
        post :create, <%= ns_file_name %>: invalid_attributes
        expect(assigns(:<%= ns_file_name %>)).to be_a_new(<%= class_name %>)
      end

      it 're-renders the new template' do
        post :create, <%= ns_file_name %>: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    let(:<%= table_name %>) { FactoryGirl.create(:<%= ns_file_name %>) }
    context 'with valid params' do
      let(:new_attributes) { FactoryGirl.attributes_for(:<%= file_name %>) }

      it 'assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>' do
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: valid_attributes
        expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
      end

      it 'redirects to the <%= ns_file_name %>' do
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: valid_attributes
        expect(response).to redirect_to(<%= file_name %>)
      end
    end

    context 'with invalid params' do
      it 'assigns the <%= ns_file_name %> as @<%= ns_file_name %>' do
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes
        expect(assigns(:<%= ns_file_name %>)).to eq(<%= file_name %>)
      end

      it 're-renders the edit template' do
        put :update, id: <%= file_name %>.to_param, <%= ns_file_name %>: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested <%= ns_file_name %>' do
      <%= file_name %> = FactoryGirl.create(:<%= ns_file_name %>)
      expect { delete :destroy, id: <%= file_name %>.to_param }.to change(<%= class_name %>, :count).by(-1)
    end

    it 'redirects to the <%= table_name %> list' do
      <%= file_name %> = FactoryGirl.create(:<%= ns_file_name %>)
      delete :destroy, id: <%= file_name %>.to_param
      expect(response).to redirect_to(<%= index_helper %>_url)
    end
  end
end
<% end %>