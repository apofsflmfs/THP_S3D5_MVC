require 'controller'

class Router
  def initialize
    @controller =  Controller.new
  end

  def perform
    system "clear" or system "cls"
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    while true
      puts
      puts "=> Tu veux faire quoi duuuuude ?"
      puts
      puts "0. Vider l'écran"
      puts "1. Créer un gossip"
      puts "2. Afficher les gossip "
      puts "3. Effacer un gossip"
      puts "4. Quitter l'app"
      print ">> "
      params = gets.chomp.to_i

      case params
      when 0
        system "clear" or system "cls"
      when 1
        puts "Tu as choisi de créer un gossip" 
        @controller.create_gossip
      when 2
        puts "Tu as choisi d'afficher les gossip"
        @controller.index_gossips
      when 3
        puts "Tu as choisi de détruire un gossip"
        @controller.destroy
      when 4
        puts "À bientôt !"
        break
      else
        puts "Erreur, merci de ressayer"
      end
    end
  end
end