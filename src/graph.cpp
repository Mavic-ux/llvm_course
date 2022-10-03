#include "wrapper.h"

void init_env(bool** & board, bool** & next_board){
    board = new bool*[SCALED_HEIGHT];
    for (int i = 0; i < SCALED_HEIGHT; i++) {
        *(board + i) = new bool[SCALED_WIDTH];
    }

    next_board = new bool*[SCALED_HEIGHT];
    for (int i = 0; i < SCALED_HEIGHT; i++) {
        *(next_board + i) = new bool[SCALED_WIDTH];
    }
}

void delete_env(bool** & board, bool** & next_board){
    for (int i = 0; i < SCALED_HEIGHT; i++) {
        delete[] board[i];
    }
    delete[] board;

    for (int i = 0; i < SCALED_HEIGHT; i++) {
        delete[] next_board[i];
    }
    delete[] next_board;
}

void put_pixel(sf::VertexArray& pixels, size_t px, size_t py, sf::Color cell) {
    pixels.append(sf::Vertex(sf::Vector2f(px, py), cell));
}

void display(sf::VertexArray pixels, sf::RenderWindow& window) {
    window.draw(pixels);
    window.display();
}
