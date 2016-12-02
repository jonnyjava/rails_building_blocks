require 'rails_helper'
<% module_namespacing do %>
RSpec.describe '<%= class_name.pluralize %>', <%= type_metatag(:request) %> do

  shared_examples_for 'fully authorized' do
    let(:<%= table_name.singularize %>) { FactoryGirl.create(:<%= table_name.singularize %>) }
    let(:<%= table_name.singularize %>_attributes) { { <%= table_name.singularize %>: FactoryGirl.attributes_for(:<%= table_name.singularize %>) } }

    describe 'GET #index' do
      it 'is authorized' do
        get <%= table_name.singularize %>s_path
        expect(response).not_to have_http_status(:unauthorized)
      end
    end

    describe 'GET #new' do
      it 'is authorized' do
        get new_<%= table_name.singularize %>_path
        expect(response).not_to have_http_status(:unauthorized)
      end
    end

    describe 'GET #show' do
      it 'is authorized' do
        get <%= table_name.singularize %>_path(<%= table_name.singularize %>)
        expect(response).not_to have_http_status(:unauthorized)
      end
    end

    describe 'GET #edit' do
      it 'is authorized' do
        get edit_<%= table_name.singularize %>_path(<%= table_name.singularize %>)
        expect(response).not_to have_http_status(:unauthorized)
      end
    end

    describe 'POST #create' do
      it 'is authorized' do
        post <%= table_name %>_path(<%= table_name.singularize %>: <%= table_name.singularize %>_attributes)
        expect(response).not_to have_http_status(:unauthorized)
      end
    end

    describe 'PUT #update' do
      it 'is authorized' do
        put <%= table_name.singularize %>_path(id: <%= table_name.singularize %>.to_param, <%= table_name.singularize %>: <%= table_name.singularize %>_attributes)
        expect(response).not_to have_http_status(:unauthorized)
      end
    end

    describe 'DELETE #destroy' do
      it 'is authorized' do
        delete <%= table_name.singularize %>_path(<%= table_name.singularize %>)
        expect(response).not_to have_http_status(:unauthorized)
      end
    end
  end

  context 'with an admin' do
    login_admin
    it_behaves_like 'fully authorized'
  end
end<% end %>
