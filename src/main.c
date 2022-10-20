#include "wrapper.h"

bool board[HEIGHT * WIDTH];
bool next_board[HEIGHT * WIDTH];


int count_cells(int x, int y) {
    int count = 0;

    if (x > 0 && x < WIDTH - 1 && y > 0 && y < HEIGHT - 1) {
        for (int dx = -1; dx <= 1; dx += 1){
            for (int dy = -1; dy <= 1; dy += 1){

                if (dx == 0 & dy == 0) continue;

                if (board[(y + dy) * WIDTH + (x + dx)]){
                    count += 1;;
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
    init_board(board);

    while(1){
        update_board();
        draw(board);
    }

    return 0; 
}
