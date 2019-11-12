class RemoveColumnCompetenceFromGrandmas < ActiveRecord::Migration[5.2]
  def change
    remove_column :grandmas, :competence
    add_reference :grandmas, :competence, foreign_key: true
  end
end
