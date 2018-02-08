class AddTagIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :tag, foreign_key: true
  end
end
