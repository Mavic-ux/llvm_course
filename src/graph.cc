#include "wrapper.h"
#include <SFML/Graphics.hpp>

sf::VertexArray pixels;
sf::RenderWindow window(sf::VideoMode(WIDTH, HEIGHT), "Window");

extern "C" void init_board(bool board[]) {
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            board[y * WIDTH + x] = rand()%2 == 0;
        } 
    }
}

extern "C" void draw(bool board[]) {
    for (int x = 0; x < WIDTH; x += 1)
    {
        for (int y = 0; y < HEIGHT; y += 1)
        {
            sf::Color cell = board[x * HEIGHT + y] ? sf::Color::Green : sf::Color::Black;
            for (int yi = 0; yi < 1; yi++)
            {
                for (int xi = 0; xi < 1; xi++)
                {
                    pixels.append(sf::Vertex(sf::Vector2f(x + xi, y + yi), cell));
                }   
            }
        }        
    }    
    
    window.draw(pixels);
    window.display();
}   
