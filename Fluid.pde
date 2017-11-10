public class Fluid{
float w;
float h;
float density;
boolean show;
float x;
float y;
public Fluid(){
  show = false;
}

private void assignData(){
  w = random(0.1*width, width);
  h = random(0.1*height, 0.4*height);
  density = random(1.5, 3)/100; //La densité est réduite ici à cause de l'échelle de gravité et de poids très basse. Sans cette mise à l,échelle, le fluid est beaucoup trop dense et agit comme trampline aux objets
  
  x=random(0, width - w);
  y = height-h;
  
  System.out.println("Densité du fluide: " + density*100);
}




public void toggleShow(){
  show = !show;
  if(show)
    assignData();
}


public void display(){
  if(show){
    fill(0,255,120);
    rect(x, y, w,h);  
  }
}
}