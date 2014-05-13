require "active_record"

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ":memory:")

ActiveRecord::Migration.suppress_messages do
  ActiveRecord::Schema.define(:version => 0) do

    create_table(:people, :force => true) do |t|
      t.string :type
      t.string :name
      t.belongs_to :father
      t.belongs_to :mother
    end

  end
end
