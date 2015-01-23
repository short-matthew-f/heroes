class Weapon
  attr_accessor :owner, :type, :quality, :damage

  def initialize(args = {})
    @owner = args[:owner]
    @damage = args[:damage]
    @type = args[:type]
    @quality = args[:quality]
  end

  def self.csv(method)
    CSV.open(
      "data/weapons.csv", method,
      headers: true,
      header_converters: :symbol
    )
  end

  def self.all
    csv = Weapon.csv("r")

    # weapons = []
    # while (weapon = csv.readline) do
    #   weapons << Weapon.new( weapon.to_h )
    # end
    # return weapons

    csv.map do |weapon|
      Weapon.new( weapon.to_h )
    end
  end

  def self.find_by_owner(name)
    csv = Weapon.csv("r")

    while (weapon = csv.readline) do
      return Weapon.new( weapon.to_h ) if weapon[:owner] == name
    end

    return nil
  end
end
