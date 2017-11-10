final int NB_OBJET = 50;
Mover heliumBall;
Mover[] objets = new Mover[NB_OBJET];
PVector wind = new PVector();
PVector friction;
PVector gravity ;
PVector heliumV;
float airFriction = 0.01;
Fluid fluid;


void setup(){
  size(800,600);
  
   for(int i =0; i < objets.length; i++){
     objets[i] = new Mover((int)random(0,width), 51, random(0.1,1), (int)random(25,50));
    
   }
  heliumBall = new Mover(width/2, 100, 0.5, 40);
  
  gravity = new PVector(0, 0.1);
  heliumV = new PVector(0, -0.1);
  airFriction = 0.01;
  fluid = new Fluid();
}

void draw(){
  input();
  update();
  render();
}



void input(){
  
}

void mousePressed(){
  if(mouseButton == LEFT)
    wind.x = 0.02;
  else if (mouseButton == RIGHT)
    wind.x = -0.02;
}

void mouseReleased(){
  wind.x =0;
}


void keyPressed(){
  if(key == ' ')
    fluid.toggleShow();
if(key == 'r')
  setup();
  
}


void update(){
  for(int i = 0; i < objets.length; i++){
    if(objets[i].isInside(fluid))
      objets[i].drag(fluid);    
    friction = objets[i].vel.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(airFriction);
    objets[i].applyForce(friction);
    objets[i].applyForce(PVector.mult(gravity, objets[i].getMass()));
    objets[i].applyForce(wind);
    objets[i].update();
  }
  
  heliumBall.applyForce(PVector.mult(gravity, heliumBall.getMass()));
  heliumBall.applyForce(heliumV);
  friction = heliumBall.vel.copy();
  friction.mult(-1);
  friction.normalize();
  friction.mult(airFriction);
  heliumBall.applyForce(friction);
  heliumBall.applyForce(wind);
  heliumBall.update();
}



void render(){
  background(82,82,255);
  fluid.display();
  for(int i =0; i < objets.length; i++){
    objets[i].display();
  }
  heliumBall.display();
  
}