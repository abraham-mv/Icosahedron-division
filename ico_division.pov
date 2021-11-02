#include	"colors.inc"		
#include	"textures.inc"	
#include	"shapes.inc"


camera{
location 2*<7,5.5,4>/1.5   
look_at <-0.5,0,0>}

light_source {
<1000,0, 0>
color	White}
  
light_source {
<0,1000, -1000>
color	White} 
background { color rgb< 1, 1, 1> } 

#fopen Salida "ico_division.xyz" write

#declare a=5;
#declare ndiv=5;
#declare d=a*0.618;

#declare ico = array[12];
#declare ico[0] = a/2*< 0    ,     1 , -0.618>;
#declare ico[1] = a/2*< 0    ,     1 ,  0.618>;
#declare ico[2] = a/2*< 1    ,  0.618,  0,   >;
#declare ico[3] = a/2*< 1    , -0.618,  0,   >;
#declare ico[4] = a/2*< 0.618,     0 ,     1,>;
#declare ico[5] = a/2*<-0.618,     0 ,     1,>;
#declare ico[6] = a/2*< 0.618,     0 ,    -1,>;
#declare ico[7] = a/2*<-0.618,     0 ,    -1,>;
#declare ico[8] = a/2*< 0    ,    -1 , -0.618>;
#declare ico[9] = a/2*< 0    ,    -1 ,  0.618>;
#declare ico[10] = a/2*<-1    , -0.618,  0,   >;
#declare ico[11] = a/2*<-1    ,  0.618,  0,   >;

#for(i,0,11,1)
    #for(j,i+1,11,1)
        #if(VDist(ico[i],ico[j]) < d+0.1)
            cylinder{ico[i],ico[j] 0.03 pigment{color Blue} finish{phong 1}}
            
            #for(k,j+1,11,1)                
                        
                #declare Ang = degrees(acos(vdot(ico[j]-ico[i],ico[k]-ico[i])/(vlength(ico[j]-ico[i])*vlength(ico[k]-ico[i]))));
                #if(VDist(ico[i],ico[k]) < d+0.1 & Ang < 63)
                        
                    #declare cont = 0;
                    #for(l,0,ndiv,1)
                        #declare cont = cont+1;
                        #for(m,0,ndiv-cont+1,1)
                                
                            #declare pos = ico[i] + (l/ndiv)*(ico[j]-ico[i]) + (m/ndiv)*(ico[k]-ico[i]);
                            sphere{pos, 0.15 pigment{color Green} finish{phong 1}}
                            #write(Salida,"Au", " " ,vstr(3,pos," ",5,7),"\n") 
                            
                        #end
                    #end
                #end
            #end
        #end
    #end
#end       
                        