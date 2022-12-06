#include "wrapper.h"

int board[HEIGHT * WIDTH];
int next_board[HEIGHT * WIDTH];

void init_board() {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            board[y * WIDTH + x] = __glang_gl_rand()%2;
        } 
    }
}

int count_cells(int x, int y) {
    int count = 0;

    if (x > 0 && x < WIDTH - 1 && y > 0 && y < HEIGHT - 1) {
        for (int dx = -1; dx <= 1; dx += 1){
            for (int dy = -1; dy <= 1; dy += 1){
                if (!(dx == 0 & dy == 0) & (board[(y + dy) * WIDTH + (x + dx)] != 0)){
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

void draw() {
    for (int x = 0; x < WIDTH; x += 1)
    {
        for (int y = 0; y < HEIGHT; y += 1)
        {
            for (int yi = 0; yi < 1; yi++){
                for (int xi = 0; xi < 1; xi++)
                {
                    __glang_gl_put_pixel(x + xi, y + yi, board[x * HEIGHT + y]);
                }   
            }
        }        
    }    
    
    __glang_gl_flush();
}   



int main(int argc, char** argv)
{
    init_board();

    while(1){
        update_board();
        draw();
    }

    return 0; 
}
