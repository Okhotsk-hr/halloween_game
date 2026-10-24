
//プレイヤーの各種変数定義
int player_x;
int player_y;
int player_w;
int player_h;

String field = "street";
int mode_num = 0;

void setup() {
    size(900,500);
    loadQuizData();
    
    //日本語文字表示
    PFont font = createFont("Meiryo", 50);
    textFont(font);
    
    //プレイヤーの初期数値設定
    player_w = 50;
    player_h = 70;
    player_x = width / 2;
    player_y = height - player_h - 20;
    
    
}

void draw() {
    background(255);
    
    
    switch(field) {
        case "street":
            //フィールドがstreet
            street_house();
            rect(player_x,player_y,player_w,player_h);
            print(player_x + ":" + player_y + "\n");
            break;
        case "house":
            //フィールドがhouse
            quiz();
            break;
        
    }
    
    
}

void keyPressed() {
    println(keyCode);
    //仮の移動速度
    int dxy = 50;
    //fieldがstreetの時
    if (field ==  "street") {
        switch(keyCode) {
            case 38 :
                // 上矢印：上移動
                player_y -= dxy;
                if (player_x!= 450) {
                    if (player_y ==  360) {
                        field = "house";
                        mode_num = 0;
                    }
                }
                if (player_y ==  110) {
                    field = "house";
                    mode_num = 0;
                }
                break;
            case 40:
                //下矢印：下移動
                player_y += dxy;
                if (player_x!= 450 && player_y ==  260) {
                    player_y -= dxy;
                }
                break;
            case 39:
                //右矢印：右移動
                player_x += dxy;
                if (player_y <=  360 &&  player_y >=  260 &&  player_x ==  500) {
                    player_x -= dxy;
                }
                break;
            case 37:
                //左矢印：左移動
                player_x -= dxy;
                if (player_y <=  360 &&  player_y >=  260 &&  player_x ==  400) {
                    player_x += dxy;
                }
                break;
        }
        if (player_y >=  460) {
            player_y = 460;
        }
        if (player_x <=  0) {
            player_x = 50;
        }
        if (player_x >=  900) {
            player_x = 850;
        }
    }
    
    if (field == "house") {
        if (key >= '1' && key <= '4') {
            answerQuiz(key - '0');
            return;
        }
        switch(keyCode) {
            case 69:
                field = "street";
                player_y += dxy;
                break;
        }
    }
}