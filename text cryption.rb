puts '---------------------------------------------------------------------------------------------------------------------'
puts '|----------------- Sifrelemek icin 1 yazin ----------------------------- Sifre cozmek icin 2 yazin -----------------|'
puts '|-------------------------------------------------------------------------------------------------------------------|'
puts "|(islem yapacaginiz metin belgesinin(sonunda '.txt' olmasi gerekli) program ile ayni dosyada oldugundan emin olunuz)|"
puts '---------------------------------------------------------------------------------------------------------------------'
print 'Yapacaginiz islem: '
girdi = gets.chomp.to_i
def okuma(metin)
  metin = (File.read "#{metin}.txt").split('')
rescue Errno::ENOENT
  puts 'metin adini yanlis girdiniz.'
  puts ''
end

def yazma(yazilanmetin)
  File.write('yeni metin.txt', yazilanmetin.join(''))
  puts 'Metniniz: '
  puts ''
  puts yazilanmetin.join('')
  puts ''
end

# sifreleme metodu
def sifreleme(n, m)
  yenimetin = []
  a = ('a'..'z').to_a
  sifre = (a[n]..'z').to_a + (a[0]..a[n - 1]).to_a

  begin
    okuma(m).each do |harf|
      if a.include?(harf)

        b = a.index(harf)
        x = sifre[b.to_i]
        yenimetin << x

      elsif ('A'..'Z').include?(harf)

        b = a.index(harf.downcase)
        x = sifre[b.to_i]
        yenimetin << x.upcase

      else
        yenimetin << harf
      end
    end
  rescue NoMethodError
    exit
  end
  yazma(yenimetin)
end

# sifre cozme metodu
def sifrecozme(n, m)
  yenimetin = []

  a = ('a'..'z').to_a
  sifre = (a[n]..'z').to_a + (a[0]..a[n - 1]).to_a

  begin
    okuma(m).each do |harf|
      if a.include?(harf)

        b = sifre.index(harf)
        x = a[b.to_i]
        yenimetin << x

      elsif ('A'..'Z').include?(harf)

        b = sifre.index(harf.downcase)
        x = a[b.to_i]
        yenimetin << x.upcase

      else
        yenimetin << harf
      end
    end
  rescue NoMethodError
    exit
  end
  yazma(yenimetin)
end

if girdi == 1 # sifreleme islemi

  puts '*************************************************************'
  print "sifrelemek istediginiz metnin adi(sonunda '.txt' olmadan): "
  m = gets.chomp.to_s
  puts '*************************************************************'

  print 'metinde kullanmak istediginiz sifreleme sayisi: '
  n = gets.chomp.to_i
  n = n % 26 # 26'dan yuksek sifreleme kullanildi ise
  puts '*************************************************************'

  sifreleme(n, m)

elsif girdi == 2 # sifre cozme islemi
  puts '*************************************************************'
  print "sifresini cozmek istediginiz metnin adi(sonunda '.txt' olmadan): "
  m = gets.chomp.to_s
  puts '*************************************************************'

  print 'metinde kullanilan sifreleme sayisi: '
  n = gets.chomp.to_i
  n = n % 26                                                                  # 26'dan yuksek sifreleme kullanildi ise
  puts '*************************************************************'

  sifrecozme(n, m)

else
  puts '--------------------------------------------------------'
  puts '                    1 veya 2 giriniz                    '
  puts '--------------------------------------------------------'
  exit
end

puts '========================================================================'
puts 'Ayrica isleminiz yeni metin olarak programin oldugu dosyaya yazilmistir.'
puts 'Eger islemi ikinci kere yaparsaniz yeni metin dosyasinin ustune yazar.  '
puts '========================================================================'
