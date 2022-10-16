#include "wrapper.h"
#include <iostream>

bool board[HEIGHT * WIDTH] = {0};
bool next_board[HEIGHT * WIDTH] = {0};


void initial_board() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            board[y * WIDTH + x] = rand()%2 == 0;
        } 
    }
}

int count_cells(int x, int y) {
    int count = 0;

    if (x > 0 && x < WIDTH - 1 && y > 0 && y < HEIGHT - 1) {
        for (int dx = -1; dx <= 1; dx++){
            for (int dy = -1; dy <= 1; dy++){

                if (dx == 0 & dy == 0) continue;

                if (board[(y + dy) * WIDTH + (x + dx)]){
                    count++;;
                }
            }
        }

    }
    
    return count;
}

void update_board() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            int count = count_cells(x, y);
            if (board[y * WIDTH + x]) {
                next_board[y * WIDTH + x] = count == 2 || count == 3;
            } else {
                next_board[y * WIDTH + x] = count == 3;
            }
        }
    }

    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            board[y * WIDTH + x] = next_board[y * WIDTH + x];
        }
    }
}


int main(int argc, char** argv)
{
    initial_board();

    while(1){
        update_board();
        draw(board);
    }
    
    return 0; 
}
