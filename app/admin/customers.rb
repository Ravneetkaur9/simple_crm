ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email, :notes, :image

  # Show list of customers with image thumbnails and key info
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email
    column :notes
    column :image do |customer|
      if customer.image.attached?
        image_tag url_for(customer.image.variant(resize_to_limit: [50, 50])), alt: "Customer Image"
      else
        status_tag "No Image"
      end
    end
    actions
  end

  # Filters for searching customers in admin
  filter :full_name
  filter :phone_number
  filter :email
  filter :created_at

  # Form to create or edit customers
  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file, hint: (f.object.image.attached? ? image_tag(url_for(f.object.image), height: '100') : content_tag(:span, "No image uploaded yet"))
    end
    f.actions
  end

  # Show view for a customer
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), alt: "Customer Image", style: "max-height: 200px;"
        else
          "No Image"
        end
      end
    end
  end
end
