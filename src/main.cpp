#include "graph.h"
#include <iostream>

#define DELTA_TIME 0.1

int main(int argc, char** argv)
{
    sf::RenderWindow window(sf::VideoMode(WIDTH, HEIGHT ,32), "Window");
    Game game (window);
    sf::Clock timer; 
    sf::Time delta_time = sf::seconds(DELTA_TIME);
    game.random_state();

    while (window.isOpen()) {
        sf::Event appEvent;
        while (window.pollEvent(appEvent)) {
            switch(appEvent.type) {
                case sf::Event::Closed:
                    window.close();
                    break;
                case sf::Event::KeyPressed:
                    if (appEvent.key.code == sf::Keyboard::R) game.random_state();
                    break;
                default:
                    break;
            }
        }

        sf::Time time = timer.getElapsedTime(); 

        if (time > delta_time) {
            game.update(window);
            game.next_state();
            timer.restart();
            window.display();
            
        }
    }

    return 0; 
}