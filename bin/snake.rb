require './snake'

Snake.setup_board!
Snake.board.box_width = ARGV[0] if ARGV[0]
Snake.board.box_width = ARGV[1] if ARGV[1]

snake = Snake::UI.new(Snake.board.box_length / 2, Snake.board.box_width / 2)
Snake.board.snakes = [ snake ]
Snake.board.register_drawing

Snake.run(snake)