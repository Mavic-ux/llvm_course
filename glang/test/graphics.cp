board[360000];
nextboard[360000];

def init_board() {
    height = 600;
    width = 600;

    ty = 0;
    while (ty < height){
        tx = 0;
        while (tx < width){
            board[ty * width + tx] = __glang_gl_rand() % 2;
            tx = tx + 1;
        }
        ty = ty + 1;
    }
    return 0;
}

def countcells(x, y) {
    height = 600;
    width = 600;

    count = 0;
    if (((x > 0) and (x < width - 1)) and ((y > 0) and (y < height - 1))){
        dx = 0;
        dx = dx - 1;
        while(dx <= 1){
            dy = 0;
            dy = dy - 1;
            while (dy <= 1){
                if ((not ((dx == 0) and (dy == 0))) and (board[(y + dy) * width + (x + dx)] != 0)){
                    count = count + 1;
                }
                dy = dy + 1;
            }
            dx = dx + 1;
        }
        x = x + 1;
    }

    return count;
}

def updateboard() {
    height = 600;
    width = 600;

    i = 0;
    while (i < height){
        j = 0;
        while (j < width){
            count = countcells(j, i);
            if (board[i * width + j] == 0){
                nextboard[i * width + j] = (count == 2 or count == 3);
            } 
            if (board[i * width + j] != 0){
                nextboard[i * width + j] = (count == 3);
            }
        }
        i = i + 1;
    }

    y = 0;
    while (y < height){
        x = 0;
        while (x < width){
            temp = nextboard[y * width + x];
            board[y * width + x] = temp;
            x = x + 1;
        }
        y = y + 1;
    }

    return 0;
}

def draw() {
    x = 0;
    while (x < width){
        y = 0;
        while (y < height){
            yi = 0;
            while(yi < 1){
                xi = 0;
                while(xi < 1){
                    temp = board[x * height + y];
                    __glang_gl_put_pixel(x, y, temp);
                    xi = xi + 1;
                }
                yi = yi + 1;
            }
            y = y + 1;
        }
        x = x + 1;
    }

    __glang_gl_flush();
}   


def main(){
    init_board();
    while(1){
        updateboard();
        draw();
    }
    return 0;
}

