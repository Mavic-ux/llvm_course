#include "wrapper.h"

Wrapper::Wrapper(sf::RenderWindow& window) {
    board = new bool*[SCALED_HEIGHT];
    for (int i = 0; i < SCALED_HEIGHT; i++) {
        *(board + i) = new bool[SCALED_WIDTH];
    }
    next_board = new bool*[SCALED_HEIGHT];
    for (int i = 0; i < SCALED_HEIGHT; i++) {
        *(next_board + i) = new bool[SCALED_WIDTH];
    }
}

Wrapper::~Wrapper() {
    for (int i = 0; i < SCALED_HEIGHT; i++) {
        delete[] board[i];
    }
    delete[] board;

    for (int i = 0; i < SCALED_HEIGHT; i++) {
        delete[] next_board[i];
    }
    delete[] next_board;
}

void Wrapper::put_pixel(size_t px, size_t py, sf::Color cell) {
    pixels.append(sf::Vertex(sf::Vector2f(px, py), cell));
}

void Wrapper::display(sf::RenderWindow& window) {
    window.draw(pixels);
    window.display();
}
