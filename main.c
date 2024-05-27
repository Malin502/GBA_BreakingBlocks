typedef volatile unsigned short hword;


#define COLOR_BLACK 0x0000
#define COLOR_RED 0x001F
#define COLOR_YELLOW 0x03FF
#define COLOR_BLUE 0x7FE0
#define COLOR_GREEN 0x07E0

#define VRAM 0x06000000
#define VRAM2 0x04000130

#define SCREEN_WIDTH 240
#define SCREEN_HEIGHT 160

#define PADDLE_WIDTH 45
#define PADDLE_HEIGHT 5
#define BALL_SIZE 5

#define BLOCK_ROWS 4
#define BLOCK_COLS 10
#define BLOCK_WIDTH 20
#define BLOCK_HEIGHT 10


void clear_screen(hword);
void draw_point(hword, hword, hword);
void draw_rectangle(hword, hword, hword, hword, hword);
void draw_paddle();
void draw_ball();
void draw_blocks();
void move_paddle(hword);
void move_ball(hword);
void init_blocks();
void check_block_ball_collision();




typedef struct {
    short x;
    short y;
    short active_flg;
} Block;


Block blocks[BLOCK_ROWS][BLOCK_COLS];

short i, j, k, n, m, col, row;
hword *ptr;
hword *key;
hword right;
hword left;
hword start;

short paddleX;
short paddleY;
hword direction_vector_paddle;
short ballX;
short ballY;
short ball_ang;
short ball_speedX;
short ball_speedY;

hword num_blocks;


short score = 0;

short game_state;



int main(void) {

    clear_screen(COLOR_BLACK);

    key = (hword*) VRAM2;
    right = 0x0010;
    left = 0x0020;
    start = 0x0008;

    paddleX = (SCREEN_WIDTH - PADDLE_WIDTH) / 2;
    paddleY = SCREEN_HEIGHT - 20;
    ballX = SCREEN_WIDTH / 2;
    ballY = SCREEN_HEIGHT / 2;
    ball_speedX = 1;
    ball_speedY = -1;

    num_blocks = BLOCK_ROWS * BLOCK_COLS;
    direction_vector_paddle = 0;
    ball_ang = 1;
    game_state = 0;

    while(1) {

        switch(game_state) {

            case 0:
                clear_screen(COLOR_BLACK);

                if((*key & start) != start) {
                    game_state = 1;
                    init_blocks();
                    draw_blocks();
                    score = 0;
                }
                break;
            case 1:

                draw_paddle();
                
                if ((*key & right) != right) {
                        move_paddle(1);
                    } else if ((*key & left) != left) {
                        move_paddle(2);
                    } else {
                        move_paddle(0);
                    }

                move_ball(direction_vector_paddle);

                check_block_ball_collision();

                
                if(num_blocks == 0) {
                    game_state = 2;
                }

                for(i = 0; i < 3500; i++){}

                break;

            case 2:
                clear_screen(COLOR_BLUE);

                paddleX = (SCREEN_WIDTH - PADDLE_WIDTH) / 2;
                paddleY = SCREEN_HEIGHT - 20;
                ballX = SCREEN_WIDTH / 2;
                ballY = SCREEN_HEIGHT / 2;
                ball_speedX = 1;
                ball_speedY = -1;
                num_blocks = BLOCK_ROWS * BLOCK_COLS;
                game_state = 0;
        }
        
    }

    return 0;
}





void draw_point(hword x, hword y, hword color) {
    ptr = (hword*) 0x04000000;
    *ptr = 0x0F03;
    ptr = (hword*) VRAM + (y * SCREEN_WIDTH) + x;
    *ptr = color;
}


void clear_screen(hword color) {
    for (i = 0; i < SCREEN_HEIGHT; i++) {
        for (j = 0; j < SCREEN_WIDTH; j++) {
            draw_point(j, i, color);
        }
    }
}


void draw_rectangle(hword x, hword y, hword width, hword height, hword color) {
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            draw_point(x + j, y + i, color);
        }
    }
}


void draw_paddle() {
    draw_rectangle(paddleX, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT, COLOR_RED);
}


void draw_ball() {
    draw_rectangle(ballX, ballY, BALL_SIZE, BALL_SIZE, COLOR_YELLOW);
}


void draw_blocks() {
    for(row = 0; row < BLOCK_ROWS; row++) {
        for(col = 0; col < BLOCK_COLS; col++) {
            if(blocks[row][col].active_flg == 1) {
                if((row + col) % 2 == 0) {
                    draw_rectangle(blocks[row][col].x, blocks[row][col].y, BLOCK_WIDTH, BLOCK_HEIGHT, COLOR_BLUE);
                } else {
                    draw_rectangle(blocks[row][col].x, blocks[row][col].y, BLOCK_WIDTH, BLOCK_HEIGHT, COLOR_GREEN);
                }
            }
        }
    }
}

void move_paddle(hword i) {

    if(i == 1){
        if(paddleX < SCREEN_WIDTH - PADDLE_WIDTH) {
            draw_rectangle(paddleX, paddleY, 3, PADDLE_HEIGHT, COLOR_BLACK);
            paddleX += 3;

            direction_vector_paddle = 1;
            if(paddleX > SCREEN_WIDTH - PADDLE_WIDTH) {
                paddleX = SCREEN_WIDTH - PADDLE_WIDTH;
            }
        } 
        
    } else if (i == 2) {

        if(paddleX > 0) {
            draw_rectangle(paddleX + PADDLE_WIDTH - 1, paddleY, 3, PADDLE_HEIGHT, COLOR_BLACK);
            paddleX = paddleX - 3;
            direction_vector_paddle = 2;
            if(paddleX < 0) {
                paddleX = 0;
            }
        }
    } else {
        direction_vector_paddle = 0;
    }
    draw_paddle();
}



void move_ball(hword direction_vector_paddle) {
    draw_rectangle(ballX, ballY, BALL_SIZE, BALL_SIZE, COLOR_BLACK);

    if(ballX <= 0 || ballX >= SCREEN_WIDTH - BALL_SIZE) {
        ball_speedX = -ball_speedX;
    }

    if(ballY <= 0) {
        ball_speedY = -ball_speedY;
    }

    if(ballY >= SCREEN_HEIGHT - BALL_SIZE) {
        game_state = 2;
    }

    if(ballY >= paddleY && ballY <= paddleY + PADDLE_HEIGHT && ballX >= paddleX && ballX <= paddleX + PADDLE_WIDTH) {
        if((direction_vector_paddle == 1 && ball_speedX > 0) || (direction_vector_paddle == 2 && ball_speedX < 0)) {
            ball_ang--;
        } else if ((direction_vector_paddle == 1 && ball_speedX < 0) || (direction_vector_paddle == 2 && ball_speedX > 0)) {
            ball_ang++;
        } 

        if(ball_ang > 3) {
            ball_ang = 0;
        } else if (ball_ang < 0) {
            ball_ang = 2;
        }

        if(ball_ang == 0) {
            if(ball_speedX > 0) {
                ball_speedX = 2;
                ball_speedY = -1;
            } else {
                ball_speedX = -2;
                ball_speedY = -1;
            }

        }else if(ball_ang == 1) {
            if(ball_speedX > 0) {
                ball_speedX = 1;
                ball_speedY = -1;
            } else {
                ball_speedX = -1;
                ball_speedY = -1;
            }

        }else if(ball_ang == 2) {
            if(ball_speedX > 0) {
                ball_speedX = 1;
                ball_speedY = -2;
            } else {
                ball_speedX = -1;
                ball_speedY = -2;
            }
        }
    }

    ballX += ball_speedX;
    ballY += ball_speedY;

    draw_ball();
}


void init_blocks() {
    hword index;

    for(row = 0; row < BLOCK_ROWS; row++) {
        for(col = 0; col < BLOCK_COLS; col++) {
            blocks[row][col].active_flg = 1;
            blocks[row][col].x = (SCREEN_WIDTH - BLOCK_COLS * (BLOCK_WIDTH + 3)) / 2 + col *  (BLOCK_WIDTH + 3);
            blocks[row][col].y = 20 + row * (BLOCK_HEIGHT + 3); 
        }
    }
}


void check_block_ball_collision() {
    for (row = 0; row < BLOCK_ROWS; row++) {
        for(col = 0; col < BLOCK_COLS; col++) {
            if(blocks[row][col].active_flg == 1 && ballX + BALL_SIZE >= blocks[row][col].x && ballX <= blocks[row][col].x + BLOCK_WIDTH && ballY + BALL_SIZE >= blocks[row][col].y && ballY <= blocks[row][col].y + BLOCK_HEIGHT) {
                if(ballX + BALL_SIZE - ball_speedX <= blocks[row][col].x || ballX - ball_speedX >= blocks[row][col].x + BLOCK_WIDTH) {
                    ball_speedX = -ball_speedX;
                } else {
                    ball_speedY = -ball_speedY;
                }

                blocks[row][col].active_flg = 0;
                num_blocks--;
                draw_rectangle(blocks[row][col].x, blocks[row][col].y, BLOCK_WIDTH, BLOCK_HEIGHT, COLOR_BLACK);
            }
        }
    }
}



