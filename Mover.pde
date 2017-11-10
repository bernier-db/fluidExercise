public class Mover{
  PVector loc;
  PVector acc;
  PVector vel;
  float mass;
  int diametre;
  float maxSpeed = 20;
  float coeff = 0.9;
  
  public Mover(int x, int y, float mass, int dia){
    loc = new PVector(x,y);
    this.mass = mass;
    diametre = dia;
    acc = new PVector();
    vel = new PVector();
    
  }
   
   public float getMass(){return mass;}
   public void applyForce(PVector force){
       PVector f = PVector.div(force,mass);
       acc.add(f);
   }
   
   public void update(){
     vel.add(acc);
     vel.limit(maxSpeed);
     checkEdges();
     loc.add(vel);
     
     acc.mult(0);
   
   }
   public boolean isInside(Fluid f){
     return f.show && (loc.x>f.x && loc.x<f.x+f.w && loc.y>f.y && loc.y<f.y+f.h);  
   }
  
  public void drag(Fluid f){
    float speed = vel.mag();
    // The force’s magnitude: Cd * v~2~
    float dragMagnitude = f.density * speed * speed;

    PVector drag = vel.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    applyForce(drag);
  }
  
  private void checkEdges(){
    if(loc.x < 0+diametre/2 || loc.x > width-diametre/2) vel.x *= -1;
    if(loc.y < 0+diametre/2 || loc.y > height-diametre/2) vel.y *= -1;
    if(loc.x<0+diametre/2) loc.x = diametre/2; else if (loc.x>width-diametre/2)loc.x=width-diametre/2;
    if(loc.y<0+diametre/2) loc.y = diametre/2; else if (loc.y>height-diametre/2){
    loc.y=height-diametre/2;
      vel.y *=coeff;
    }
  }
  
  public void display(){
    int teinte = (int)(1/mass*50);
    fill(teinte, mass*255);
    ellipse(loc.x, loc.y, diametre, diametre);
  }
   

}