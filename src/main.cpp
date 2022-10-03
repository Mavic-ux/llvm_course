#include "wrapper.h"

int main(int argc, char** argv)
{
    bool** board;
    bool** next_board;

    sf::VertexArray pixels;
    sf::RenderWindow window(sf::VideoMode(WIDTH, HEIGHT), "Window");

    init_env(board, next_board);
    initial_board(board);

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
                    if (appEvent.key.code == sf::Keyboard::R) initial_board(board);
                    break;
                default:
                    break;
            }
        }

        if (timer.getElapsedTime() > delta_time) {
            display(pixels, window);
            update_board(board, next_board);
            render_board(pixels, board);;
            timer.restart();            
        }
    }

    delete_env(board, next_board);
    return 0; 
}
