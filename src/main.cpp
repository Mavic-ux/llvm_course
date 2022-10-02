#include "wrapper.h"
#define DELTA_TIME 0.01

int main(int argc, char** argv)
{
    sf::RenderWindow window(sf::VideoMode(WIDTH, HEIGHT , 32), "Window");
    Wrapper wrapper(window);
    wrapper.initial_state();

    sf::Clock timer; 
    sf::Time delta_time = sf::seconds(DELTA_TIME);

    while (window.isOpen()) {
        sf::Event appEvent;
        while (window.pollEvent(appEvent)) {
            switch(appEvent.type) {
                case sf::Event::Closed:
                    window.close();
                    break;
                case sf::Event::KeyPressed:
                    if (appEvent.key.code == sf::Keyboard::R) wrapper.initial_state();
                    break;
                default:
                    break;
            }
        }

        if (timer.getElapsedTime() > delta_time) {
            wrapper.display(window);
            wrapper.next_state();
            timer.restart();            
        }
    }

    return 0; 
}
