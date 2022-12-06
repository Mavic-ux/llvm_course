def init_board() {
    HEIGHT = 600;
    WIDTH = 600;

    ty = 0;
    while (ty < HEIGHT){
        tx = 0;
        while (tx < WIDTH){
            tx = tx + 1;
        }
        ty = ty + 1;
    }
    return 0;
}

def main(){
    init_board();
}