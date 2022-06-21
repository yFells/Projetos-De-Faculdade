import gifAnimation.*;

Gif myAnimation;

void setup() {
    size(400,400);
    myAnimation = new Gif(this, "ronaldinho.gif");
    myAnimation.play();
}

void draw() {
    image(myAnimation, 10, 10, 110, 110);
}
