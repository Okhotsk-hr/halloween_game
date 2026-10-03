int house_x = 100;
int house_y = 100;

void house() {
    rect(20,20,house_x,house_y);
    rect(150,20,house_x,house_y);
    rect(280,20,house_x,house_y);
    rect(410,20,house_x,house_y);
    rect(540,20,house_x,house_y);
    rect(670,20,house_x,house_y);
    //キャラクターの家？
    rect(800,20,house_x - 20,house_y);
    
    
    rect(20,280,house_x,house_y);
    rect(150,280,house_x + 10,house_y);
    rect(300,280,house_x + 20,house_y);
    rect(520,280,house_x,house_y);
    rect(650,280,house_x,house_y);
    rect(780,280,house_x,house_y);
}