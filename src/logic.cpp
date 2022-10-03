#include "wrapper.h"

#include <cstdlib>
#include <ctime>

void render_board(sf::VertexArray& pixels, bool** board) {
    for (int x = 0; x < WIDTH; x += CELL_SIZE)
    {
        for (int y = 0; y < HEIGHT; y += CELL_SIZE)
        {
            int board_x = x / CELL_SIZE;
            int board_y = y / CELL_SIZE;    
            sf::Color cell = board[board_y][board_x] ? sf::Color::Green : sf::Color::Black;
            for (int yi = 0; yi < CELL_SIZE; yi++)
            {
                for (int xi = 0; xi < CELL_SIZE; xi++)
                {
                    put_pixel(pixels, x+xi, y+yi, cell);
                }   
            }
        }        
    }    
} 

void initial_board(bool** board) {
    for (int y = 0; y < SCALED_HEIGHT; y++) {
        for (int x = 0; x < SCALED_WIDTH; x++) {
            board[y][x] = rand()%2 == 0;
        } 
    }
}

void update_board(bool** board, bool** next_board) {
    for (int y = 0; y < SCALED_HEIGHT; y++) {
        for (int x = 0; x < SCALED_WIDTH; x++) {
            int count = count_cells(board, x, y);
            if (board[y][x]) {
                next_board[y][x] = count == 2 || count == 3;
            } else {
                next_board[y][x] = count == 3;
            }
        }
    }

    for (int y = 0; y < SCALED_HEIGHT; y++) {
        for (int x = 0; x < SCALED_WIDTH; x++) {
            board[y][x] = next_board[y][x];
        }
    }
}

int count_cells(bool** board, int x, int y) {
    int count = 0;

    if (x > 0 && x < SCALED_WIDTH - 1 && y > 0 && y < SCALED_HEIGHT - 1) {
        for (int dx = -1; dx <= 1; ++dx){
            for (int dy = -1; dy <= 1; ++dy){

                if (dx == 0 & dy == 0) continue;

                if (board[y + dy][x + dx]){
                    count++;;
                }
            }
        }

    }
    
    return count;
}
