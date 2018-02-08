class CreateJoinTableJobsTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :tags do |t|
      t.references :job, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
