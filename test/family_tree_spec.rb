require 'test_helper'

# base Person class knows about parents
class Person < ActiveRecord::Base
  belongs_to :father, class_name: "Person", foreign_key: "father_id"
  belongs_to :mother, class_name: "Person", foreign_key: "mother_id"
end

# Male specialisation knows about children (as a father)
class Male < Person
  has_many :children, class_name: "Person", foreign_key: "father_id"
end

# Female specialisation knows about children (as a mother)
class Female < Person
  has_many :children, class_name: "Person", foreign_key: "mother_id"
end

describe Person do
  before do
    Person.delete_all
    brother && sister && cousin
  end

  let(:father)  { Male.create }
  let(:mother)  { Female.create }
  let(:brother) { Male.create( father: father, mother: mother ) }
  let(:sister)  { Female.create( father: father, mother: mother ) }
  let(:uncle)   { Male.create }
  let(:aunt)    { Female.create }
  let(:cousin)  { Male.create( father: uncle, mother: aunt ) }

  describe "#father" do
    it { brother.father.must_equal father }
    it { brother.father.must_equal sister.father }
  end

  describe "#mother" do
    it { brother.mother.must_equal mother }
    it { brother.mother.must_equal sister.mother }
  end

  describe "#children" do
    describe "when male" do
      it { father.children.count.must_equal 2 }
      it { father.children.must_include brother }
      it { father.children.must_include sister }
    end
    describe "when female" do
      it { aunt.children.must_equal [cousin] }
    end
  end

end
