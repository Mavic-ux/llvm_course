#ifndef __IRGEN_GEN_HH__
#define __IRGEN_GEN_HH__

#include <stdbool.h>

#define WIDTH 600
#define HEIGHT 600

#ifdef __cplusplus
extern "C" 
{
#endif

    void initial_board(bool board[]);
    void draw(bool board[]);

#ifdef __cplusplus
}
#endif /*__cplusplus */

#endif /* __IRGEN_GEN_HH__ */