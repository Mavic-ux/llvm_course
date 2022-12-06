#include <SFML/Graphics.hpp>
#include <iostream>
#include "library.h"

#define WIDTH 600
#define HEIGHT 600

sf::VertexArray pixels;
sf::RenderWindow window(sf::VideoMode(WIDTH, HEIGHT), "Window");

extern "C" int __glang_gl_rand() {
    return rand();
}

extern "C" void __glang_gl_put_pixel(int x, int y, int status) {
    sf::Color color = status ? sf::Color::Green : sf::Color::Black;
    sf::Vertex point({x, y}, color);
    window.draw(&point, 1, sf::Points);
}


extern "C" void __glang_gl_flush() {
    window.draw(pixels);
    window.display();
}
