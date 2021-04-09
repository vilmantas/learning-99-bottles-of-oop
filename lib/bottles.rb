class Bottles

    def verses(start, finish)
        result = ''

        if finish == -1
            finish = start
        end

        (finish..start).reverse_each do |digit|

            if digit == 0

                result += "\n" unless result == ''

                result += <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
VERSE
            else
                bottle_text_main = "bottles"

                bottle_text_main = "bottle" if digit == 1

                bottle_text = "bottles"

                bottle_text = "bottle" if digit - 1 == 1

                first_line = ''

                first_line += "\n" if result != '' and digit != 0

                first_line += "#{digit} #{bottle_text_main} of beer on the wall, #{digit} #{bottle_text_main} of beer.\n"

                second_line = "Take one down and pass it around, #{digit-1} #{bottle_text} of beer on the wall.\n"

                second_line = "Take it down and pass it around, no more bottles of beer on the wall.\n" if digit - 1 == 0

                result += first_line + second_line
            end
        end

        return result
    end

    def verse(start)
        return verses(start, -1)
    end

    def song
        return verses 99, 0
    end
end

puts Bottles.new.verses(99, 98)