#spec/my_enumerables_spec.rb

require './my_enumerables.rb'

describe Enumerable do

  context "#my_each" do
    
    it "returns the original array once it is done with the block" do
      array = [1,2,3]
      expect( array.my_each  { |x| x *2} ).to eql(array)
    end

    it "returns the original range once it is done with the block" do
      range = (0..10)
      expect( range.my_each  { |x| x *2} ).to eql(range)
    end

    it "returns the original hash once it is done with the block" do
      country_codes_hash = {
        'keniya'=>254,
        'uganda'=>256,
        'eritrea'=>291
      }
      expect( country_codes_hash.my_each  { |country| puts country} ).to eql(country_codes_hash)
    end
  end
end