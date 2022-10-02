#include <SFML/Graphics.hpp>

#define CELL_SIZE 2
#define WIDTH 800
#define HEIGHT 600
#define A_WIDTH WIDTH / CELL_SIZE
#define A_HEIGHT HEIGHT / CELL_SIZE

class Game
{
    private:
        bool** board;
        bool** next_board;

        sf::VertexArray pixels;

    public:

        Game(sf::RenderWindow& window);
        Game(sf::RenderWindow& window, bool** inputArray);
        ~Game();

        void put_pixel(size_t px, size_t py, sf::Color cell);
        void random_state();
        void random_array();
        int count_cells(int x, int y);
        void next_state();
        void image_from_array();
        void update(sf::RenderWindow& window);
};