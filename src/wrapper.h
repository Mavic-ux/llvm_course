#include <SFML/Graphics.hpp>

#include <cstdlib>
#include <ctime>


#define CELL_SIZE 2
#define WIDTH 800
#define HEIGHT 600
#define A_WIDTH WIDTH / CELL_SIZE
#define A_HEIGHT HEIGHT / CELL_SIZE

class Wrapper
{
    private:
        bool** board;
        bool** next_board;

        sf::VertexArray pixels;

    public:

        Wrapper(sf::RenderWindow& window);
        Wrapper(sf::RenderWindow& window, bool** inputArray);
        ~Wrapper();

        void put_pixel(size_t px, size_t py, sf::Color cell);
        void initial_state();
        int count_cells(int x, int y);
        void next_state();
        void process_board();
        void display(sf::RenderWindow& window);
};
