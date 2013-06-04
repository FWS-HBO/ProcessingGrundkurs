void pathfinding(){
/////////////////////////////pathfinding///////////////////////////


 minsave=0;
 min=0;
 int walldownright=0;
 int wallupright=0;
 int walldownleft=0;
 int wallupleft=0;                                       //man kann nich durch dünne wände

 for (int i = 0 ; i <= openlist.size()-1 ; i++){        //sucht den punkt mit der niedrigsten heuristik
  
   Viereck myPunkt = (Viereck) openlist.get(i);            
   Viereck myPunktmin = (Viereck) openlist.get(min);
  
   if(myPunkt.heuristik3<=myPunktmin.heuristik3){
     min=i;  
   }
   myPunktmin = (Viereck) openlist.get(min);
   minsave=myPunktmin.name;                            //und gibt den punktnamen/vierecknamen als minsave aus 
 }
 
 // println(min);
 // println(minsave);
 
try{

   myViereck[minsave].toclosedlist();                   //die funktion toclosedenlist in der klasse aufrufen
   closedlist.add(myViereck[minsave]);                  //den punkt der closedlist hinzufügen 
   myViereck[minsave].onclosedlist=1;
   openlist.remove(min);                                //den punkt von der openlist entfernen
 
  if(myViereck[minsave-mapsize].heuristik2+myViereck[minsave].heuristik1+1<myViereck[minsave-mapsize].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
     &&myViereck[minsave-mapsize].coll==0
     &&myViereck[minsave-mapsize].onclosedlist==0)
     {
       
       myViereck[minsave-mapsize].zeiger=minsave;
       myViereck[minsave-mapsize].heuristik1=myViereck[minsave].heuristik1+1;
       
        if(myViereck[minsave-mapsize].onopenlist==0){
     openlist.add(myViereck[minsave-mapsize]);
     }
     
       myViereck[minsave-mapsize].toopenlist();
       
      
       
     }
     if(myViereck[minsave-mapsize].coll==1){
    walldownleft=walldownleft+1;
    wallupleft=wallupleft+1;}  
     
    
  if(myViereck[minsave+mapsize].heuristik2+myViereck[minsave].heuristik1+1<myViereck[minsave+mapsize].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
     &&myViereck[minsave+mapsize].coll==0
     &&myViereck[minsave+mapsize].onclosedlist==0)
     {
       
       myViereck[minsave+mapsize].zeiger=minsave;
       myViereck[minsave+mapsize].heuristik1=myViereck[minsave].heuristik1+1;
       
         if(myViereck[minsave+mapsize].onopenlist==0){
     openlist.add(myViereck[minsave+mapsize]);
     }  
     
       myViereck[minsave+mapsize].toopenlist();
     
   
     }
     
      if(myViereck[minsave+mapsize].coll==1){
    walldownright=walldownright+1;
    wallupright=wallupright+1;}
    
  if(myViereck[minsave-1].heuristik2+myViereck[minsave].heuristik1+1<myViereck[minsave-1].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
     &&myViereck[minsave-1].coll==0
     &&myViereck[minsave-1].onclosedlist==0)
    {
     
     myViereck[minsave-1].zeiger=minsave;
     myViereck[minsave-1].heuristik1=myViereck[minsave].heuristik1+1;
     
      if(myViereck[minsave-1].onopenlist==0){
     openlist.add(myViereck[minsave-1]);
     }  
     
     myViereck[minsave-1].toopenlist();
     
    
    }
    
     if(myViereck[minsave-1].coll==1){
    wallupleft=wallupleft+1;
    wallupright=wallupright+1;}
    
  if(myViereck[minsave+1].heuristik2+myViereck[minsave].heuristik1+1<myViereck[minsave+1].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
    &&myViereck[minsave+1].coll==0
    &&myViereck[minsave+1].onclosedlist==0)
    {
     
     myViereck[minsave+1].zeiger=minsave;
     myViereck[minsave+1].heuristik1=myViereck[minsave].heuristik1+1;
     
     if(myViereck[minsave+1].onopenlist==0){
     openlist.add(myViereck[minsave+1]);
     }  
     
     myViereck[minsave+1].toopenlist();
     
 
    }
   if(myViereck[minsave+1].coll==1){
    walldownright=walldownright+1;
    walldownleft=walldownleft+1;}
   
   //////////////////////////////////////////////////////


  if(myViereck[minsave-mapsize-1].heuristik2+myViereck[minsave].heuristik1+2<myViereck[minsave-mapsize-1].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
     &&myViereck[minsave-mapsize-1].coll==0
     &&myViereck[minsave-mapsize-1].onclosedlist==0
     &&wallupleft<=1)
     {
      
       myViereck[minsave-mapsize-1].zeiger=minsave;
       myViereck[minsave-mapsize-1].heuristik1=int(myViereck[minsave].heuristik1+2);
       
        if(myViereck[minsave-mapsize-1].onopenlist==0){
     openlist.add(myViereck[minsave-mapsize-1]);
     }  
       
       
       myViereck[minsave-mapsize-1].toopenlist();
    }
    
  if(myViereck[minsave+mapsize+1].heuristik2+myViereck[minsave].heuristik1+2<myViereck[minsave+mapsize+1].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
     &&myViereck[minsave+mapsize+1].coll==0
     &&myViereck[minsave+mapsize+1].onclosedlist==0
     &&walldownright<=1)
     {
       
       myViereck[minsave+mapsize+1].zeiger=minsave;
       myViereck[minsave+mapsize+1].heuristik1=int(myViereck[minsave].heuristik1+2);
       
     if(myViereck[minsave+mapsize+1].onopenlist==0){
     openlist.add(myViereck[minsave+mapsize+1]);
     }  
       
       
       myViereck[minsave+mapsize+1].toopenlist();
     }

   
   
  if(myViereck[minsave-1+mapsize].heuristik2+myViereck[minsave].heuristik1+2<myViereck[minsave-1+mapsize].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
     &&myViereck[minsave-1+mapsize].coll==0
     &&myViereck[minsave-1+mapsize].onclosedlist==0
     &&wallupright<=1)
    {
      
     myViereck[minsave-1+mapsize].zeiger=minsave;
     myViereck[minsave-1+mapsize].heuristik1=int(myViereck[minsave].heuristik1+2);
     
      if(myViereck[minsave-1+mapsize].onopenlist==0){
     openlist.add(myViereck[minsave-1+mapsize]);
     }  
     
     
     myViereck[minsave-1+mapsize].toopenlist();
    }
   
   
   
  if(myViereck[minsave+1-mapsize].heuristik2+myViereck[minsave].heuristik1+2<myViereck[minsave+1-mapsize].heuristik3  //es wird geguckt ob der neue weg kürtzer ist ob das feld passierbar ist und ob es schon in der closedlist steht
    &&myViereck[minsave+1-mapsize].coll==0
    &&myViereck[minsave+1-mapsize].onclosedlist==0
    &&walldownleft<=1
    )
    {
     
     myViereck[minsave+1-mapsize].zeiger=minsave;
     myViereck[minsave+1-mapsize].heuristik1=int(myViereck[minsave].heuristik1+2);
     
      if(myViereck[minsave+1-mapsize].onopenlist==0){
     openlist.add(myViereck[minsave+1-mapsize]);
     }  
     
     
     myViereck[minsave+1-mapsize].toopenlist();
    } 
   
  


}
catch (NullPointerException e) {
println("error [x0000057:zy3] openlist is empty");
fill(0,0,255);
textSize(32);
text("Error [x0000057:zy3] openlist is empty: es gibt keine Lösung" ,mapsize*20+10,480);
  
}
 

}
