class Hero
  attr_accessor :name, :profession, :weapon, :health

  # def name
  #   @name
  # end
  #
  # def name=(new_name)
  #   @name = new_name
  # end

  def initialize(args = {})
    @name = args[:name]
    @profession = args[:profession]
    @health = args[:health]

    @weapon = args[:weapon] || self.find_my_weapon
  end

  def self.csv(method)
    CSV.open(
      "data/heroes.csv", method,
      headers: true,
      header_converters: :symbol
    )
  end

  def self.all
    csv = Hero.csv("r")

    csv.map do |hero|
      Hero.new( hero.to_h )
    end
  end

  def self.find_by_name(name)
    csv = Hero.csv("r")

    while (hero = csv.readline) do
      return Hero.new( hero.to_h ) if hero[:name] == name
    end

    return nil
  end

  def self.create(args = {})
    hero = Hero.new(args)

    CSV.open("data/heroes.csv", "a",
             headers: true,
             header_converters: :symbol) do |csv|
        csv << [hero.name, hero.profession, hero.health]
    end
  end

  def find_my_weapon
    Weapon.find_by_owner(name) # name calls self.name returns @name
  end

  def grab_my_weapon
    # self.weapon= is an instance method that assigns to @weapon
    # so we could use self.weapon = find_my_weapon instead
    @weapon = find_my_weapon
  end

  def save
    CSV.open(
      "data/heroes.csv", 'a',
      headers: true,
      header_converters: :symbol
    ) do |file|
      file << [name,profession,health]
    end
  end

end
