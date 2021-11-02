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


#fopen Salida "ico_truncado.xyz" write

#write ( Salida,"60  ", "\n") 
#write ( Salida, "Icosaedro truncado","\n")  

//Se declaran radios para esferas y cilindros y las texturas
#declare Rs=0.15;    
#declare Rc=0.1;
#declare Rc1=0.03;
#declare ts= texture{ pigment{color Blue}};  
#declare tc= texture{ pigment{color Green}};
#declare tc1= texture{ pigment{color Red}};

#declare a = 6.8928;
#declare V = array[12]
#declare V[0] = a/2*< 0    ,     1 , -0.618>;
#declare V[1] = a/2*< 0    ,     1 ,  0.618>;
#declare V[2] = a/2*< 1    ,  0.618,  0,   >;
#declare V[3] = a/2*< 1    , -0.618,  0,   >;
#declare V[4] = a/2*< 0.618,     0 ,     1,>;
#declare V[5] = a/2*<-0.618,     0 ,     1,>;
#declare V[6] = a/2*< 0.618,     0 ,    -1,>;
#declare V[7] = a/2*<-0.618,     0 ,    -1,>;
#declare V[8] = a/2*< 0    ,    -1 , -0.618>;
#declare V[9] = a/2*< 0    ,    -1 ,  0.618>;
#declare V[10] = a/2*<-1    , -0.618,  0,   >;
#declare V[11] = a/2*<-1    ,  0.618,  0,   >;

#declare i = 0;
#while (i < 12)
    sphere{V[i], Rs texture{ts} finish{phong 1}}
    //#write(Salida,"C", " " ,vstr(3,V[i]," ",5,7),"\n")
    #declare j = i + 1;
    #while (j < 12)
        #if(VDist(V[i],V[j]) < a*0.618+0.1)
            cylinder {V[i],V[j] Rc1 texture{tc} finish{phong 1}}
            #declare A = V[i] + (V[j]-V[i])/3;
            #declare B = V[i] + 2*(V[j]-V[i])/3;
            sphere{A, Rs texture{tc} finish{phong 1}}
            sphere{B, Rs texture{tc} finish{phong 1}}
            #write(Salida,"C", " " ,vstr(3,A," ",5,7),"\n")
            #write(Salida,"C", " " ,vstr(3,B," ",5,7),"\n")
        #end
        #declare j = j + 1;
    #end
    #declare i = i + 1;
#end 
       