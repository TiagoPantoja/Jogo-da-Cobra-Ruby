require 'singleton'
require 'stringio'

module Snake
    class Board
      include Singleton

      attr_acessor :box_length, box_width, :drawing, :snakes
      def register_drawing
        if @box_length.nil? || @box_width.nil?
          raise RuntimeError, "Tamanho do campo?"
        end       
        @drawing = Hash.new(' ')
        
        register_borders      
        register_snakes
      end

      def draw!
        str = StringIO.new
        @box_width.times do |y|
          @box_length.times do |x|
            str.printf("%s", @drawing[[x,y]])
            str.printf("\n") if x == @box_length - 1
          end
        end
        str.rewind
        puts str.read
        str.rewind
        str
      end
      
      private
  
      def register_snakes
        @snakes.each{|snake|
          @drawing[snake.current_head] = '~'
        }
      end
  
      def register_borders
        @box_length.times do |x|
          @box_width.times do |y|
            if x==0 || x==@box_length-1 ||  y == 0 || y==@box_width-1
              @drawing[[x,y]] = '.'
            end
          end
        end
      end
      
    end
  end
