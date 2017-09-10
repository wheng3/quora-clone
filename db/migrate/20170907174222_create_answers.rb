class CreateAnswers < ActiveRecord::Migration[5.0]
	def change
			create_table :answers do |t|
			t.string :comment
			t.references(:user, :question, index: true)
			t.timestamps
		end
	end
end
