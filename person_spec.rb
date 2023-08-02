
require_relative 'person'

RSpec.describe Person do
  let(:person) { Person.new(30, 'Mr.', 'John Doe', parent_permission: true) }

  describe '#initialize' do
    it 'creates a new person object with the correct attributes' do
      expect(person.age).to eq(30)
      expect(person.name).to eq('John Doe')
      expect(person.parent_permission).to eq(true)
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is underage and has parent permission' do
      let(:person) { Person.new(15, 'Miss', 'Alice', parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is underage and has no parent permission' do
      let(:person) { Person.new(17, 'Mr.', 'Bob', parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to eq(false)
      end
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#add_rental' do
    let(:rental) { instance_double('Rental') }

    it 'adds a rental to the person and sets the person on the rental' do
      expect(rental).to receive(:person=).with(person)
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

end
