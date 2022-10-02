#pragma once
#include <SFML/Graphics.hpp>

#define DELTA_TIME 0.01
#define CELL_SIZE 2
#define WIDTH 800
#define HEIGHT 600
#define SCALED_WIDTH WIDTH / CELL_SIZE
#define SCALED_HEIGHT HEIGHT / CELL_SIZE

class Wrapper
{
    private:
        bool** board;
        bool** next_board;

        sf::VertexArray pixels;

    public:

        Wrapper(sf::RenderWindow& window);
        ~Wrapper();

        void put_pixel(size_t px, size_t py, sf::Color cell);
        void render_board();
        void initial_board();
        int count_cells(int x, int y);
        void update_board();
        void display(sf::RenderWindow& window);
};
