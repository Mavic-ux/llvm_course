#ifndef __GAME_OF_LIFE__
#define __GAME_OF_LIFE__

#include <stdbool.h>

#define WIDTH 600
#define HEIGHT 600

#ifdef __cplusplus
extern "C" 
{
#endif

    void init_board(bool board[]);
    void draw(bool board[]);

#ifdef __cplusplus
}
#endif /*__cplusplus */

#endif /*__GAME_OF_LIFE__*/