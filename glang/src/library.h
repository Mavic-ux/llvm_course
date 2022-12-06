#include <stdbool.h>

#define WIDTH 600
#define HEIGHT 600

#ifdef __cplusplus
extern "C" 
{
#endif
    int __glang_gl_rand();
    void __glang_gl_put_pixel(int x, int y, int color);
    void __glang_gl_flush();

#ifdef __cplusplus
}
#endif /*__cplusplus */
