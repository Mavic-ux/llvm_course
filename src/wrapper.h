#pragma once
#include <SFML/Graphics.hpp>

#define DELTA_TIME 0.001
#define CELL_SIZE 2
#define WIDTH 800
#define HEIGHT 600
#define SCALED_WIDTH WIDTH / CELL_SIZE
#define SCALED_HEIGHT HEIGHT / CELL_SIZE

void init_env(bool** & board, bool**  & new_board);

void delete_env(bool** & board, bool** & new_board);

void put_pixel(sf::VertexArray& pixels, size_t px, size_t py, sf::Color cell);

void render_board(sf::VertexArray& pixels, bool** board);

void initial_board(bool** board);

int count_cells(bool** board, int x, int y);

void update_board(bool** board, bool** next_board);

void display(sf::VertexArray pixels, sf::RenderWindow& window);
