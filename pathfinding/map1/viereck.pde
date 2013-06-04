class Viereck {
  int x,y,color1=255;
  float zoom;
  int coll;
  int name;
  int saveedit;
  int heuristik1;
  int heuristik2;
  int heuristik3=1000;
  int onclosedlist;
  int zeiger;           //zeigt auf den vorherigen block
  int waypoint;
  int editable=1;
  int onopenlist;

  
  Viereck(int _x,int _y){
    
    x=_x;
    y=_y;
   heuristik2=int((((mapsize*viereckX)-2*viereckX-x)/viereckX)+(((mapsize*viereckY)-2*viereckY-y)/viereckY));

    
    
  }
 
  void edit(){
   

   

   if(mouseX>=x&&mouseX<x+20&&mouseY>=y&&mouseY<y+20){
    stroke(255,0,0);
    strokeWeight(5);
   
   
   if(mousePressed&&mouseButton == LEFT){  
     color1=0;
     coll=1;
   }
   
   if(mousePressed&&mouseButton == RIGHT){
     color1=255;
     coll=0;
   }
   
   }
   
   
    if(color1==11){
       color1=0;}
    if(color1==10){
       color1=255;}  
    
  


  }
  
  
  void toopenlist(){
    
  heuristik3=heuristik2+heuristik1;
  onopenlist=1;

  
  }
  
  
  void toclosedlist(){
    
  onclosedlist=1;  
  if(heuristik2==0){
  found=1;
  myViereck[zeiger].waypoint=1;  }
  onopenlist=0; 
  
  if(heuristik2==0){
  found=1;
  myViereck[zeiger].waypoint=1;  
   
  }
  
  }
  
  
  void found(){
    
    if(waypoint==1){
    fill(0,255,0);
    
    
    try{ 
    myViereck[zeiger].waypoint=1;   
    }
    catch(NullPointerException e){
     println("line has been drawn");
    
    }
    }
   
  
  }
  
  
  void draw(){
   
  noCursor(); 
   
  if(keyPressed&&key=='b'&&saveedit==0){
    
   save=save+" "+coll;
   saveedit=1;
  }
    
    if(editable==1){edit();}
    
    fill(color1);
    
    if(onclosedlist==1){
      fill(0,100,0);
    }
    
    if(onopenlist==1){
      fill(0,0,200,50);
     
    }
    
    if(found==1){
    found();}  

    
    if(name==mapsize+2){
      
      fill(0,255,0);
      
      editable=0;
      
    }
    
    if(name==sq(mapsize)-mapsize-1){
      fill(255,0,0);
      editable=0;
      //println(heuristik3);
    }
    

    
    rect(x,y,viereckX,viereckY);
    stroke(0);
    strokeWeight(1);
    fill(0);
    //text(name,x,y+10);
  }
  
}
