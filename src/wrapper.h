#ifndef __GAME_OF_LIFE__
#define __GAME_OF_LIFE__

#include <stdbool.h>

#define WIDTH 600
#define HEIGHT 600

#ifdef __cplusplus
extern "C" 
{
#endif

    int gl_rand();
    void gl_put_pixel(int x, int y, int color);
    void gl_flush();

#ifdef __cplusplus
}
#endif /*__cplusplus */

#endif /*__GAME_OF_LIFE__*/