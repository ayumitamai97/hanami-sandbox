Hanami::Model.migration do
  change do
    create_table :attendances do
      primary_key :id
      column :user_id, :Bignum, null: false

      column :started_at, DateTime, null: false
      column :ended_at, DateTime
      column :approved_at, DateTime
      column :deleted_at, DateTime

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
