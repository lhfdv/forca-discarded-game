class Forca

  def initialize
    @word = words.sample
    @lives = 10
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += "_ "
    end
  end

  def words
    [
      ["bola", "Um objeto esférico"],
      ["andar", "Ação de se movimentar em pé"],
      ["gritar", "Voz alta"],
      ["livro", "Objeto com páginas"],
      ["deserto", "Local quente"],
    ]
  end

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts ""
      puts "Digite uma letra"
      puts ""
      guess = gets.chomp

      good_guess = @word.first.include? guess

      if guess == "fim"
        puts "Obrigado por jogar!"
      elsif good_guess
        puts ""
        puts "Está correto"
        puts ""

        print_teaser guess

        if @word.first == @word_teaser.split.join
          puts "Parabéns. A vitória é sua!"
        else
          make_guess
        end
      else
        @lives -= 1
        puts ""
        puts "Cuidado! Você só tem #{ @lives } tentativas restantes. Tente novamente."
        puts ""
        make_guess
      end
    else
      puts ""
      puts "Derrota. Jogue novamente..."
      puts ""
    end
  end

  def begin
    puts ""
    puts "Novo jogo! A sua palavra tem #{ @word.first.size } letras"
    puts ""
    puts "Digite fim para sair"
    puts ""
    print_teaser

    puts "Pista: #{ @word.last }"

    make_guess
  end

end

game = Forca.new
game.begin
