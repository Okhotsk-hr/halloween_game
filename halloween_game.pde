
//プレイヤーの各種変数定義
float player_x;
float player_y;
float player_w;
float player_h;

void setup() {
    size(900,500);
    
    //プレイヤーの初期数値設定
    player_w = 50;
    player_h = 70;
    player_x = width / 2;
    player_y = height - player_h - 20;
    
    
}

void draw() {
    background(255);
    
    rect(player_x,player_y,player_w,player_h);
    house();
    
    
}

void keyPressed() {
    println(keyCode);
    //仮の移動速度
    int dxy = 50;
    switch(keyCode) {
        case 38 :
            // 上移動
            player_y -= dxy;
            break;
        case 40:
            //下移動
            player_y += dxy;
            break;
        case 39:
            //右移動
            player_x += dxy;
            break;
        case 37:
            //左移動
            player_x -= dxy;
            break;
    }
}