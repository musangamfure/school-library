require_relative '../nameable'
require_relative '../base_decorator'
require_relative '../trimmer_decorator'
require_relative '../capitalize_decorator'

RSpec.describe Nameable do
  context "when the correct_name method is called on Nameable" do
    it "raises NotImplementedError" do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

RSpec.describe BaseDecorator do
  context "when correct_name method is called on BaseDecorator" do
    it "delegates to the wrapped nameable object's correct_name" do
      nameable = Nameable.new
      base_decorator = BaseDecorator.new(nameable)
      allow(nameable).to receive(:correct_name).and_return("Test Name")
      expect(base_decorator.correct_name).to eq("Test Name")
    end
  end
end

RSpec.describe TrimmerDecorator do
  context "when correct_name method is called on TrimmerDecorator" do
    it "returns the first 10 characters of the wrapped nameable object's correct_name" do
      nameable = Nameable.new
      allow(nameable).to receive(:correct_name).and_return("Long Name Here")
      trimmer_decorator = TrimmerDecorator.new(nameable)
      expect(trimmer_decorator.correct_name).to eq("Long Name ")
    end
  end
end

RSpec.describe CapitalizeDecorator do
  context "when correct_name method is called on CapitalizeDecorator" do
    it "returns the wrapped nameable object's correct_name in capitalized form" do
      nameable = Nameable.new
      allow(nameable).to receive(:correct_name).and_return("hello world")
      capitalize_decorator = CapitalizeDecorator.new(nameable)
      expect(capitalize_decorator.correct_name).to eq("Hello world")
    end
  end
end
