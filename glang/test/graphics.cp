board[360000];
nextboard[360000];

fn init_board() {
    HEIGHT = 600;
    WIDTH = 600;

    ty = 0;
    while (ty < HEIGHT){
        tx = 0;
        while (tx < WIDTH){
            board[ty * WIDTH + tx] = __glang_rand() % 2;
            tx = tx + 1;
        }
        ty = ty + 1;
    }
    return 0;
}

fn countcells(x, y) {
    HEIGHT = 600;
    WIDTH = 600;
    
    count = 0;
  
    return count;
}

fn updateboard() {
    HEIGHT = 600;
    WIDTH = 600;

    i = 0;
    while (i < HEIGHT){
        j = 0;
        while (j < WIDTH){
            count = countcells(j, i);
            if (board[i * WIDTH + j] == 0){
                nextboard[i * WIDTH + j] = (count == 2 || count == 3);
            } 
            if (board[i * WIDTH + j] != 0){
                nextboard[i * WIDTH + j] = (count == 3);
            }
        }
        i = i + 1;
    }

    y = 0;
    while (y < HEIGHT){
        x = 0;
        while (x < WIDTH){
            temp = nextboard[y * WIDTH + x];
            board[y * WIDTH + x] = temp;
            x = x + 1;
        }
        y = y + 1;
    }

    return 0;
}

fn draw() {
    HEIGHT = 600;
    WIDTH = 600;

    x = 0;
    while (x < WIDTH){
        y = 0;
        while (y < HEIGHT){
            yi = 0;
            while(yi < 1){
                xi = 0;
                while(xi < 1){
                    temp = board[x * HEIGHT + y];
                    __glang_put_pixel(x, y, temp);
                    xi = xi + 1;
                }
                yi = yi + 1;
            }
            y = y + 1;
        }
        x = x + 1;
    }

    __glang_flush();
}   


fn main(){
    init_board();
    while(1){
        updateboard();
        draw();
    }
    return 0;
}

