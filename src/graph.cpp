#include "graph.h"

#include <iostream>
#include <cstdlib>
#include <ctime>



void Game::put_pixel(size_t px, size_t py, sf::Color cell) {
    pixels.append(sf::Vertex(sf::Vector2f(px, py), cell));
}

Game::Game(sf::RenderWindow& window) {
    board = new bool*[A_HEIGHT];
    for (int i = 0; i < A_HEIGHT; i++) {
        *(board + i) = new bool[A_WIDTH];
    }
    next_board = new bool*[A_HEIGHT];
    for (int i = 0; i < A_HEIGHT; i++) {
        *(next_board + i) = new bool[A_WIDTH];
    }
    window.draw(pixels);
}

Game::~Game() {
    for (int i = 0; i < A_HEIGHT; i++) {
        delete[] board[i];
    }
    delete[] board;

    for (int i = 0; i < A_HEIGHT; i++) {
        delete[] next_board[i];
    }
    delete[] next_board;
}

void Game::random_state() {
    random_array();
    image_from_array();
}

void Game::random_array() {
    srand(time(0));
    for (int x = 0; x < A_WIDTH; x++) {
        for (int y = 0; y < A_HEIGHT; y++) {
            board[y][x] = rand()%2 == 0;
        } 
    }
}

void Game::image_from_array() {
    for (int x = 0; x < WIDTH; x+=CELL_SIZE)
    {
        for (int y = 0; y < HEIGHT; y+=CELL_SIZE)
        {
            int board_x = x / CELL_SIZE;
            int board_y = y / CELL_SIZE;
            sf::Color cell = board[board_y][board_x] ? sf::Color::Green : sf::Color::Black;
            for (int yi = 0; yi < CELL_SIZE; yi++)
            {
                for (int xi = 0; xi < CELL_SIZE; xi++)
                {
                    put_pixel(x+xi, y+yi, cell);
                }   
            }
        }        
    }    
} 

void Game::next_state() {
    for (int y = 0; y < A_HEIGHT; y++) {
        for (int x = 0; x < A_WIDTH; x++) {
            int count = count_cells(x, y);
            if (board[y][x]) {
                next_board[y][x] = count == 2 || count == 3;
            } else {
                next_board[y][x] = count == 3;
            }
        }
    }
    for (int y = 0; y < A_HEIGHT; y++) {
        for (int x = 0; x < A_WIDTH; x++) {
            board[y][x] = next_board[y][x];
        }
    }
    for (int y = 0; y < HEIGHT; y+=CELL_SIZE) {
        for (int x = 0; x < WIDTH; x+=CELL_SIZE) {
            int board_x = x / CELL_SIZE;
            int board_y = y / CELL_SIZE;
            sf::Color colour = board[board_y][board_x] ? sf::Color::Green : sf::Color::Black;
            for (int yi = 0; yi < CELL_SIZE; yi++) {
                for (int xi = 0; xi < CELL_SIZE; xi++) {
                    put_pixel(x + xi, y+yi, colour);
                }
            }
        }
    }
}

int Game::count_cells(int x, int y) {
    int count = 0;\
    if (x > 0 && x < A_WIDTH-1 && y > 0 && y < A_HEIGHT-1) {
        if (board[y-1][x-1]) count++;
        if (board[y-1][x]) count++;
        if (board[y-1][x+1]) count++;
        if (board[y][x+1]) count++;
        if (board[y+1][x+1]) count++;
        if (board[y+1][x]) count++;
        if (board[y+1][x-1]) count++;
        if (board[y][x-1]) count++;
    }
    
    return count;
}

void Game::update(sf::RenderWindow& window) {
    window.draw(pixels);
}