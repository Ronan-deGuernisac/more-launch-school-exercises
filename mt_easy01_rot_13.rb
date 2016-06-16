require 'pry'
def rot13_decode(string)
  letters = ('a'..'z').to_a
  chars = string.downcase.split ''
  chars.map! do |char|
    if !letters.index(char)
      char
    elsif letters.index(char) <= 12
      letters[(letters.index(char)) + 13]
    else
      letters[(letters.index(char)) - 13]
    end
  end
  chars.join
end

array = [ 'Nqn Ybirynpr',
          'Tenpr Ubccre',
          'Nqryr Tbyqfgvar',
          'Nyna Ghevat',
          'Puneyrf Onoontr',
          'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
          'Wbua Ngnanfbss',
          'Ybvf Unyog',
          'Pynhqr Funaaba',
          'Fgrir Wbof',
          'Ovyy Tngrf',
          'Gvz Orearef-Yrr',
          'Fgrir Jbmavnx',
          'Xbaenq Mhfr',
          'Wbua Ngnanfbss',
          'Fve Nagbal Ubner',
          'Zneiva Zvafxl',
          'Lhxvuveb Zngfhzbgb',
          'Unllvz Fybavzfxv',
          'Tregehqr Oynapu']

array.each { |item| p rot13_decode(item)}
