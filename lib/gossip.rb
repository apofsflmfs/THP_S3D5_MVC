class Gossip
attr_reader :content, :author

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open('db/gossip.csv', 'a') do |csv|
      csv << [@author,@content]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach('db/gossip.csv') do |row|
      all_gossips << Gossip.new(row[0],row[1])
    end
    return all_gossips
  end

  def self.destroy(gossip)
    array_csv_rows = CSV.read("db/gossip.csv")
    destroy_index = array_csv_rows.index([gossip.author,gossip.content])

    CSV.open("db/gossip.csv", "wb") do |csv|
      array_csv_rows.each_with_index do |row,index|
        if index == destroy_index
          csv << [nil,nil]
        else
          csv << [row[0],row[1]]
        end
      end
    end
  end
end