

Viereck[] myViereck =new Viereck[6401];


int viereckX=20;
int viereckY=20;
int h=1;
int scrollX,scrollY;
float zoom=1;
int edit=1;
String save;
String[] list;
ArrayList openlist;
ArrayList closedlist;
int min = 0;
int minsave;
int found;
int mapsize=20;
int start=1;

void setup(){
 
size(displayWidth,displayHeight);


 
 //////////////////////////////////////////////////////////////////////

 

  
 for(int i=0;i<mapsize;i++){                                  //alle vierecke werden produziert
     for(int s=0;s<mapsize;s++){
     myViereck[h]=new Viereck(i*viereckX,s*viereckY);
     h=h+1;
    }
 }
  
 for(int i=1;i<=sq(mapsize);i++){

   myViereck[i].name=i;
 }
 
   
 for(int i=1;i<=mapsize;i++){                                //die rand vierecke werden als wand makiert und unpassierbar und un veränderbar gemacht
   myViereck[i].color1=1;
   myViereck[i].coll=1;
   myViereck[i].editable=0;

 }
 
 for(int i=1;i<=sq(mapsize);i=i+mapsize){ 
   myViereck[i].color1=1;
   myViereck[i].coll=1; 
   myViereck[i].editable=0;
 }

 
 for(int i=int(sq(mapsize)-mapsize);i<=sq(mapsize);i++){
   myViereck[i].color1=1;
   myViereck[i].coll=1;
   myViereck[i].editable=0; 
 }
 
 for(int i=mapsize;i<=sq(mapsize);i=i+mapsize){
   myViereck[i].color1=1;
   myViereck[i].coll=1;
   myViereck[i].editable=0;
 
 }
 
 
 
 ////////////////////////////////////////////////////////////////////////
 
 openlist=new ArrayList();
 closedlist=new ArrayList();
 openlist.add(myViereck[mapsize+2]);    //das start viereck adden 
 

 
 
 }





 //////////////////////////////////////////////////////////////////////////

void update(){
 
if(edit==1){
  if(keyPressed){
   if(key=='+'){
    zoom=zoom+0.01;
   }
   if(key=='-'){
    zoom=zoom-0.01; 
   }
  }
  
  if(zoom==0.1){
   zoom=0.1; 
  }
  
  if(mouseX>=mapsize*viereckY){
    scrollX=scrollX-2;
  }
  
  if(mouseX<=0){
    scrollX=scrollX+2;
  }
  
  if(mouseY>=mapsize*viereckY){
    scrollY=scrollY-2;
  }
  
  if(mouseY<=0){
    scrollY=scrollY+2;
  }
  
  
  if(keyPressed){
    
   if(key=='a'){
      scrollX=scrollX+10;
   }
    if(key=='d'){
      scrollX=scrollX-10;
   }
    if(key=='s'){
      scrollY=scrollY-10;
   }
    if(key=='w'){
      scrollY=scrollY+10;
   }
   
   
   
  }
}

}





void draw(){
  

  

  
  
  
background(100);
update();



if(keyPressed&&key==' '&&found==0&&start==1){                //pathfinding wird ausgeführt
println("lol");
 for(int i=1;i<=sq(mapsize);i++){
   myViereck[i].editable=0;
 }
  pathfinding();

}




if(found==1){
  println("found");}




list = split(save, ' ');

if(myViereck[1].saveedit==1){
  saveStrings("map.txt", list);
    for(int i=1;i<=sq(mapsize);i++){
      myViereck[1].saveedit=0;
}
}


if(keyPressed&&key=='l'){
  String lines[] = loadStrings("map.txt");
  
    for (int i = 1 ; i <= sq(mapsize); i++) {  
       myViereck[i].color1=int(lines[i])+10;
       myViereck[i].coll=int(lines[i]); 
}

}


translate(width/2,height/2);
scale(zoom,zoom);
translate((width/2)*-1,(height/2)*-1);
translate(scrollX,scrollY);



///////////////////////////////drawing/////////////////////////////

for(int i=1;i<=sq(mapsize);i++){
  myViereck[i].zoom =zoom;  
  myViereck[i].draw();
}


/////////////help////////////////////////



fill(0,0,0);  
textSize(32);
text("Benutze die Maus, um Wände zu ziehen", mapsize*20+10,0+32);
text("Scrolle hin und her mit W,A,S,D",mapsize*20+10,40+32); 
text("Benutze + und - um zu zoomen",mapsize*20+10,80+32);

text("Speicher deine Karte durch das Drücken",mapsize*20+10,160+32);
text("von B und dann K (du kannst pro Programstart nur einmal speichern).",mapsize*20+10,200+32);
text("Lade eine karte mit L",mapsize*20+10,240+32);
text("Wegpunkte in der openlist werden violet makiert",mapsize*20+10,280+32);
text("Wegpunkte in der closedlist grün",mapsize*20+10,320+32);
text("der kürzeste Weg ist hellgrün.",mapsize*20+10,360+32);
text("Wenn du fertig bist starte die Wegfindung mit der Leertaste.",mapsize*20+10,400+32);
textSize(10);
text("start",19,35);
text("ende",mapsize*20-41,mapsize*20-25);

if(keyPressed){
if(key=='r'){
    reset(); 
   }
}
   
}



