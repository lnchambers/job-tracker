class AddJobIdToTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :job, foreign_key: true
  end
end
