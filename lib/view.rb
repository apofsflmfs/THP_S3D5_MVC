class View

  def create_gossip
    puts
    puts "Saisis ton nom d'auteur:"
    print ">> "
    author_str = gets.chomp
    puts
    puts "Saisis ton contenu:"
    print ">> "
    content_str = gets.chomp
    return params = {content: content_str, author: author_str}
  end

  def index_gossips(gossip_array)
    puts "-"*60
    gossip_array.each_with_index do |gossip, index|
      if gossip.author
        puts
        puts "\"#{gossip.content}\""
        puts
        puts "ID= #{index} - Auteur= #{gossip.author}"
        puts "-"*60
      end
    end
  end

  def destroy_gossip(gossip_array)
    while(true)
      puts
      puts "Quel gossip souhaites-tu supprimer? Saisis son ID."
      puts "zz => annuler"
      print ">> "
      params = gets.chomp
      if params == "zz"
        return "zz"
      elsif (params.to_i>0) && (params.to_i < gossip_array.length)
        return gossip_array[params.to_i]
      else
        puts "Saisie erronée, veuillez recommencer"
      end
    end
  end
end