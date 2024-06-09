function [Max_EFs,NP,D,XRmin,XRmax,solution_num,root,fun_name] = NES_Parameter(fun_num)
%EQUATIONS_ Summary of this function goes here
%   Detailed explanation goes here
if fun_num==1
    Max_EFs=50000;
    NP=100;
    D = 2;
    XRmin = [-3,-3];
    XRmax = [3,3];
    load('NES_roots/NES_F01_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F01';
elseif fun_num==2
    Max_EFs=50000;
    NP=100;
    D = 2;
    XRmin = [-2,-2];
    XRmax = [2,2];
    load('NES_roots/NES_F02_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F02';
elseif fun_num==3
    Max_EFs=50000;
    NP=100;
    D = 2;
    XRmin = [-2,-2];
    XRmax = [2,2];
    load('NES_roots/NES_F03_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F03';
elseif fun_num==4
    Max_EFs=300000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) = 0;
        max_realvar(i) = 1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F04_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F04';
elseif fun_num==5
    Max_EFs=50000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) =-1;
        max_realvar(i) =1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F05_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F05';
 elseif fun_num==6
    Max_EFs=30000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) =-5;
        max_realvar(i) =5;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F06_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F06';
elseif fun_num==7
    Max_EFs=100000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) = -2.0;
        max_realvar(i) = 2.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F07_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F07';
elseif fun_num==8
    Max_EFs=100000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) = -1.0;
        max_realvar(i) = 1.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F08_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='F08';
elseif fun_num==9
    Max_EFs=50000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) = -10.0;
        max_realvar(i) = 10.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F09_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F09';
elseif fun_num==10
    Max_EFs=50000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) = 0;
        max_realvar(i) = 2*pi;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F10_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F10';  
elseif fun_num==11
    Max_EFs=50000;
    NP=100;
    D =2 ;
    for i=1:D
        min_realvar(i) = -1.0;
        max_realvar(i) = 1.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F11_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='F11';
elseif fun_num==12
    Max_EFs=50000;
    NP=100;
    D =3 ;
    XRmin = [1,0.2,0.1];
    XRmax = [2.5,2,3];
    load('NES_roots/NES_F12_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F12';
elseif fun_num==13
    Max_EFs=100000;
    NP=100;
    D =3 ;
    for i=1:D
        min_realvar(i) = -3;
        max_realvar(i) = 3;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F13_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F13';
elseif fun_num==14
    Max_EFs=300000;
    NP=100;
    D =3 ;
    for i=1:D
        min_realvar(i) =0;
        max_realvar(i) =50;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F14_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F14';  
elseif fun_num==15
    Max_EFs=200000;
    NP=100;
    D =3 ;
    for i=1:D
        min_realvar(i) =-3;
        max_realvar(i) =3;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F15_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F15';
elseif fun_num==16
    Max_EFs=50000;
    NP=100;
    D =3 ;
    XRmin = [0,-10,-1];
    XRmax = [2,10,1];
    load('NES_roots/NES_F16_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F16';
elseif fun_num==17
    Max_EFs=50000;
    NP=100;
    D =3 ;
    for i=1:D
        min_realvar(i) = -1;
        max_realvar(i) = 1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F17_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F17';
elseif fun_num==18
    Max_EFs=200000;
    NP=100;
    D =3 ;
    for i=1:D
        min_realvar(i) = -10;
        max_realvar(i) = 10;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F18_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F18';
elseif fun_num==19
    Max_EFs=100000;
    NP=100;
    D =3 ;
    for i=1:D
        min_realvar(i) =0;
        max_realvar(i) =1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F19_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F19';
 elseif fun_num==20
    Max_EFs=50000;
    NP=100;
    D =3 ;
    XRmin =[-0.6,-0.6,-5];
    XRmax =[6,0.6,5];
    load('NES_roots/NES_F20_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F20';   
elseif fun_num==21
    Max_EFs=500000;
    NP=100;
    D =3 ;
    for i=1:D
        min_realvar(i) = -20;
        max_realvar(i) = 20;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F21_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F21'; 
elseif fun_num==22
    Max_EFs=50000;
    NP=100;
    D =4 ;
    for i=1:D
        min_realvar(i) = 0.0;
        max_realvar(i) = 5.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F22_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='F22';  
elseif fun_num==23
    Max_EFs=500000;
    NP=100;
    D =4 ;
    for i=1:D
        min_realvar(i) = -2.0;
        max_realvar(i) = 2.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F23_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F23';
elseif fun_num==24
    Max_EFs=100000;
    NP=100;
    D =5;
    for i=1:D
        min_realvar(i) = -10.0;
        max_realvar(i) = 10.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F24_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F24';  
elseif fun_num==25
    Max_EFs=100000;
    NP=100;
    D = 8;
    for i=1:D
        min_realvar(i) = -3;
        max_realvar(i) = 3;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F25_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F25'; 
elseif fun_num==26
    Max_EFs=100000;
    NP=100;
    D =8 ;
    for i=1:D
        min_realvar(i) = -1;
        max_realvar(i) = 1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F26_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F26';  
elseif fun_num==27
    Max_EFs=100000;
    NP=100;
    D = 9;
    for i=1:D
        min_realvar(i) = -3;
        max_realvar(i) = 3;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F27_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F27';   
elseif fun_num==28
    Max_EFs=50000;
    NP=100;
    D = 10;
    for i=1:D
        min_realvar(i) = -2;
        max_realvar(i) = 2;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F28_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F28';
elseif fun_num==29
    Max_EFs=50000;
    NP=100;
    D =20 ;
    for i=1:D
        min_realvar(i) = -1.0;
        max_realvar(i) = 1.0;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F29_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='F29';     
elseif fun_num==30
    Max_EFs=200000;
    NP=100;
    D =20 ;
    for i=1:D
        min_realvar(i) = -2;
        max_realvar(i) = 2;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    load('NES_roots/NES_F30_Roots.mat')
    solution_num=num_of_roots;
    root=roots_of_NES;
    fun_name='NES_F30';
elseif fun_num==31
    Max_EFs=1000000;
    NP=500;
    D =3 ;
    for i=1:D
        min_realvar(i) = -1;
        max_realvar(i) = 1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    solution_num=[];
    root=[];
    fun_name='NES_F31';
elseif fun_num==32
    Max_EFs=1000000;
    NP=500;
    D =6 ;
    for i=1:D
        min_realvar(i) = -1;
        max_realvar(i) = 1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    solution_num=[];
    root=[];
    fun_name='NES_F32';
elseif fun_num==33
    Max_EFs=1000000;
    NP=500;
    D =20 ;
    for i=1:D
        min_realvar(i) = -1;
        max_realvar(i) = 1;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    solution_num=[];
    root=[];
    fun_name='NES_F33';
elseif fun_num==34
    Max_EFs=1000000;
    NP=500;
    D =10 ;
    for i=1:D
        min_realvar(i) = -10;
        max_realvar(i) = 10;
    end
    XRmin = min_realvar;
    XRmax = max_realvar;
    solution_num=[];
    root=[];
    fun_name='NES_F34';
elseif fun_num==35
    Max_EFs=1000000;
    NP=500;
    D =5 ;
    XRmin = [0.001, 0,0.001,0.001,0.001];
    XRmax = [  0.1,40,  0.1,    1,    1];
    solution_num=[];
    root=[];
    fun_name='NES_F35';
end