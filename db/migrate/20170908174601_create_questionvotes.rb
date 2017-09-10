class CreateQuestionvotes < ActiveRecord::Migration
	def change
		create_table :questionvotes do |t|
		t.references(:user, :question, index: true)
		t.timestamps
		end
	end
end
