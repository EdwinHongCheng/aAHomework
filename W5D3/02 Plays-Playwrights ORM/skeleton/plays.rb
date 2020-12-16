require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  # W5D3 HW: Plays-Playwrights ORM - Starts Here:

  def self.find_by_title(title) # Finished
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL

    return nil if play.length == 0

    # Self-Note: play is an array with a hash of values
    # ex. [{"id"=>1, "title"=>"All My Sons", "year"=>1947, "playwright_id"=>1}]

    # returning a new instance of a play
    # ex. #<Play:0x00007fcf2f0f9c58 @id=1, @playwright_id=1, @title="All My Sons", @year=1947>
    Play.new(play.first) 
  end

  def self.find_by_playwright(name) # Finished - tested + works

    # Self-Note: name parameter is the playwright's name

    plays = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        plays
      JOIN
        playwrights
      ON
        plays.playwright_id = playwrights.id
      WHERE
        playwrights.name = ?
    SQL

    plays.map { |play| Play.new(play) }
  end

  # Solution's Version: 
  # instead of using JOIN, makes use of Playwright.find_by_name(name) 
  # and saves it to a variable, to use the playwright's id in our query

  # def self.find_by_playwright(name)
  #   playwright = Playwright.find_by_name(name)
  #   raise "#{name} not found in DB" unless playwright

  #   plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
  #     SELECT
  #       *
  #     FROM
  #       plays
  #     WHERE
  #       playwright_id = ?
  #   SQL

  #   plays.map { |play| Play.new(play) }
  # end

end


class Playwright # Finished
  attr_accessor :id, :name, :birth_year

  def self.all # Finished
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name) # Finished
      playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    return nil if playwright.length == 0

    # playwright is stored in an array
    Playwright.new(playwright.first) 
  end

  # Self-Note: only enter a hash with "name" and "birth_year" values
  # don't enter anything for id, let the methods do it
  # or else, our instance won't show up in our database if we do Playwright.all

  # ex. test = Playwright.new({"name"=>"Test", "birth_year"=>777777})
  # then, must do this to add our instance to the database: test.create
  def initialize(options) # Finished
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  # Note: Solution has Playwright#insert instead of Playwright#create
  # both are functionally the same
  def create # Finished
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  # to update: use attribute accessor
  # ex. test.birth_year = 2020
  # then: test.update
  # to check if things updated correctly: Playwright.all
  def update # Finished

    raise "#{self} not in database" unless self.id

    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays # Finished

    raise "#{self} not in database" unless self.id

    plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL

    plays.map { |play| Play.new(play) }
  end

end
