function f=NES_func(x,func_num)


% benchmark_func.m is the main function for 25 test functions, all minimize
% problems
% e.g. f=benchmark_func(x,func_num)
% x is the variable, f is the function value
% func_num is the function num,



if func_num==1 fhd=str2func('NES_F01');
elseif func_num==2 fhd=str2func('NES_F02');
elseif func_num==3 fhd=str2func('NES_F03');
elseif func_num==4 fhd=str2func('NES_F04');
elseif func_num==5 fhd=str2func('NES_F05');
elseif func_num==6 fhd=str2func('NES_F06');
elseif func_num==7 fhd=str2func('NES_F07');
elseif func_num==8 fhd=str2func('NES_F08');
elseif func_num==9 fhd=str2func('NES_F09');
elseif func_num==10 fhd=str2func('NES_F10');
elseif func_num==11 fhd=str2func('NES_F11');
elseif func_num==12 fhd=str2func('NES_F12');
elseif func_num==13 fhd=str2func('NES_F13');
elseif func_num==14 fhd=str2func('NES_F14');
elseif func_num==15 fhd=str2func('NES_F15');
elseif func_num==16 fhd=str2func('NES_F16');
elseif func_num==17 fhd=str2func('NES_F17');
elseif func_num==18 fhd=str2func('NES_F18');
elseif func_num==19 fhd=str2func('NES_F19');
elseif func_num==20 fhd=str2func('NES_F20');
elseif func_num==21 fhd=str2func('NES_F21');
elseif func_num==22 fhd=str2func('NES_F22');
elseif func_num==23 fhd=str2func('NES_F23');
elseif func_num==24 fhd=str2func('NES_F24');
elseif func_num==25 fhd=str2func('NES_F25');
elseif func_num==26 fhd=str2func('NES_F26');
elseif func_num==27 fhd=str2func('NES_F27');
elseif func_num==28 fhd=str2func('NES_F28');
elseif func_num==29 fhd=str2func('NES_F29');
elseif func_num==30 fhd=str2func('NES_F30');
elseif func_num==31 fhd=str2func('NES_F31');
elseif func_num==32 fhd=str2func('NES_F32');
elseif func_num==33 fhd=str2func('NES_F33');
elseif func_num==34 fhd=str2func('NES_F34');
elseif func_num==35 fhd=str2func('NES_F35');
end
f=feval(fhd,x);
f=-f;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%Unimodal%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	1.NES_O1 Function
function fit=NES_F01(x)
    y1=x(1)-sin(2*x(1)+3*x(2))-cos(3*x(1)-5*x(2));
    y2=x(2)-sin(x(1)-2*x(2))+cos(x(1)+3*x(2));
    fit=y1^2+y2^2;
end

% 	1.NES_O2 Function
function fit=NES_F02(x)
    y1=4*x(1)^3-3*x(1)-cos(x(2));
    y2=sin(x(1)^2)-abs(x(2));
    fit=y1^2+y2^2;
end
% 	1.NES_O3 Function
function fit=NES_F03(x)

    y1=exp(x(1)^2+x(2)^2)-3;
    y2=abs(x(2))+x(1)-sin(3*(abs(x(2))+x(1)));
    fit=y1^2+y2^2 ; 
end
% 	1.NES_O4 Function
function fit=NES_F04(x)
x1=x(1);x2=x(2);
y(1) = 0.04 * ( 11/15 - x1 ) * exp( 10*x1/(1+x1/100) ) - x1;
y(2) = 0.04 * ( 2.2 - 2*x1 - 3*x2 ) * exp( 10*x2/(1+x2/100) ) + x1 - 3*x2;
fit=0;
for i=1:2
    fit=fit+y(i)^2;
end
end
% 	1.NES_O5 Function
function fit=NES_F05(x)
y1=x(1)-0.5;
y2=x(1)*sin(x(2)^2*pi*4+0.75*x(1)-0.25);
fit=y1^2+y2^2;
end
% 	1.NES_O6 Function
function fit=NES_F06(x)
x1=x(1);x2=x(2);
y(1) = 4*x1*x1*x1+4*x1*x2+2*x2*x2-42*x1-14;
y(2) = 4*x2*x2*x2+2*x1*x1+4*x1*x2-26*x2-22;
fit=0;
for i=1:2
    fit=fit+y(i)^2;
end
end
% 	1.NES_O7 Function
function fit=NES_F07(x)
y1=sin(x(1)^3)-3*x(1)*x(2)^2-1;
y2=cos(3*x(1)^2*x(2))-abs(x(2)^3)+1;
fit=y1^2+y2^2;
end
% 	1.NES_O8 Function
function fit=NES_F08(x)
y1=x(2)-sin(5*pi*x(2));
y2=x(1)-x(2);
fit=y1^2+y2^2;
end
% 	1.NES_09 Function
function fit=NES_F09(x)
y1=cos(2.0*x(1))-cos(2.0*x(2))-0.4;
y2=2.0*(x(2)-x(1))+sin(2.0*x(2))-sin(2.0*x(1))-1.2;
fit=y1^2+y2^2;
end
% 	1.NES_10 Function
function fit=NES_F10(x)
y1=-sin(x(1))*cos(x(2))-2*cos(x(1))*sin(x(2));
y2=-cos(x(1))*sin(x(2))-2*sin(x(1))*cos(x(2));
fit=y1^2+y2^2;
end
% 	1.NES_11 Function
function fit=NES_F11(x)
y1=x(2)-cos(4*pi*x(1));
y2=x(1)^2+x(2)^2-1.0;
fit=y1^2+y2^2;
end
% 	1.NES_12 Function
function fit=NES_F12(x)
    y1=0.1*x(1)+cos(2*x(2))+0.09240;
    y2=sin(3*x(3))+sin(10*x(1)/3)+log(2*x(2))-2.52*x(3)+0.08805;
    y3=2*(x(1)-0.75)^2+sin(16*pi*x(2)-pi/2)-3.26815;
    fit=y1^2+y2^2+y3^2;
end
% 	1.NES_13 Function
function fit=NES_F13(x)
x1=x(1);x2=x(2); x3=x(3);
u = 3*x1 + x2 - x3;
v = x1*x1 - x2 + x3;
y(1) = 3*u*u + 2*v - 3*x1 + x1*x2 + x3*x3 - 24;
y(2) = u - 3*v*v - x1 + 2*x2 - x1*x3 + 10;
y(3) = 2*u - v + x1 - x2*x2 + 2*x3 - 5;
fit=0;
for i=1:3
    fit=fit+y(i)^2;
end
end
% 	1.NES_14 Function
function fit=NES_F14(x)
x1=x(1);x2=x(2);x3=x(3);
y(1) = x1*x2 + (x1 - 2*x3) * (x2 - 2*x3) - 165.0;
y(2) = x1*x2*x2*x2/12 - (x1-2*x3)*((x2-2*x3)^3)/12 - 9369.0;
y(3) = 2*(x2-x3)*(x2-x3)*(x1-x3)*(x1-x3)*x3/(x1+x2-2*x3) - 6835.0;
fit=0;
for i=1:3
    fit=fit+y(i)^2;
end
end
% 	1.NES_15 Function
function fit=NES_F15(x)
x1=x(1);x2=x(2); x3=x(3);
u = 2*x1 - x2*x2 - 3*x3;
v = x1*x1 + 2*x2 - x2*x3;
w = x1*x2 - 3*x3;
y(1) = 2*u - 3*x1*v + v - x2*w - 3*x1 - 2*x2*x3 - x3 +12;
y(2) = u*u + 2*v + x2*w - 2*x1 - x2*x2 - x1*x3 - 2;
y(3) = 3*u - v*w + 2*w + x1 - x1*x3 + 6;
fit=0;
for i=1:3
    fit=fit+y(i)^2;
end
end
% 	1.NES_16 Function
function fit=NES_F16(x)
x1=x(1);x2=x(2);x3=x(3);
y(1) = x1*x1 - x1 - x2*x2 - x2 + x3*x3;
y(2) = sin(x2 - exp(x1));
y(3) = x3 - log(abs(x2));
fit=0;
for i=1:3
    fit=fit+y(i)^2;
end
end
% 	1.NES_17 Function
function fit=NES_F17(x)
n= size(x,2);
temp = sum(x,2);
for i=1:n
    y(i) = x(i) - cos(2*x(i) - temp);
end
fit=0;
for i=1:n
    fit=fit+y(i)^2;
end
end
% 	1.NES_18 Function
function fit=NES_F18(x)
x1=x(1);x2=x(2);x3=x(3);
y(1) =-9 -1*x2*x2 -1*x3*x3 + 3*x2*x2*x3*x3 + 8*x2*x3;
y(2) =-9 -1*x3*x3 -1*x1*x1 + 3*x1*x1*x3*x3 + 8*x1*x3;
y(3) =-9 -1*x1*x1 -1*x2*x2 + 3*x2*x2*x1*x1 + 8*x2*x1;
fit=0;
for i=1:3
    fit=fit+y(i)^2;
end
end
% 	1.NES_19 Function
function fit=NES_F19(x)
x1=x(1);x2=x(2); x3=x(3);
y(1) = -3.84*x1*x1 + 3.84*x1 - x2;
y(2) = -3.84*x2*x2 + 3.84*x2 - x3;
y(3) = -3.84*x3*x3 + 3.84*x3 - x1;
fit=0;
for i=1:3
    fit=fit+y(i)^2;
end
end
% 	1.NES_20 Function
function fit=NES_F20(x)
y1=5*x(1)^9-6*x(1)^5*x(2)^2+x(1)*x(2)^4+2*x(1)*x(3);
y2=-2*x(1)^6*x(2)+2*x(1)^2*x(2)^3+2*x(2)*x(3);
y3=x(1)^2+x(2)^2- 0.265625;
fit=y1^2+y2^2+y3^2;
end
% 	1.NES_21 Function
function fit=NES_F21(x)
x1=x(1);x2=x(2); x3=x(3);
y(1) =-13 -1*x2*x2-1*x3*x3 +24*x2*x3 -1*x2*x2*x3*x3;
y(2) = -13 -1*x3*x3-1*x1*x1 + 24*x3*x1-1*x1*x1*x3*x3;
y(3) = -13 -1*x1*x1 -1*x2*x2 +24*x1*x2-1*x2*x2*x1*x1;
fit=0;
for i=1:3
    fit=fit+y(i)^2;
end
end
% 	1.NES_22 Function
function fit=NES_F22(x)
 y1=3-x(1)*x(3)^2;
 y2=x(3)*sin(pi./x(2))-x(3)-x(4);
 y3=-x(2)*x(3)*exp(1-x(1)*x(3))+0.2707;
 y4=2*x(1)^2*x(3)-x(2)^4*x(3)-x(2);
 fit=y1^2+y2^2+y3^2+y4^2;  
end
% 	1.NES_23 Function
function fit=NES_F23(x)
y1=x(1)^2+2*x(2)^2+cos(x(3))-x(4)^2;
y2=3*x(1)^2+x(2)^2+sin(x(3))^2-x(4)^2;
y3=-2*x(1)^2-x(2)^2-cos(x(3))+x(4)^2;
y4=-x(1)^2-2*x(2)^2-cos(x(3))^2+x(4)^2;
fit=y1^2+y2^2+y3^2+y4^2;
end
% 	1.NES_24 Function
function fit=NES_F24(x)
x1=x(1);x2=x(2);x3=x(3);x4=x(4);x5=x(5);
y1= 2*x1 + x2 + x3 + x4 + x5 - 6.0;
y2 = x1 + 2*x2 + x3 + x4 + x5 - 6.0;
y3 = x1 + x2 + 2*x3 + x4 + x5 - 6.0;
y4 = x1 + x2 + x3 + 2*x4 + x5 - 6.0;
y5 = x1*x2*x3*x4*x5 - 1.0;
fit=y1^2+y2^2+y3^2+y4^2+y5^2;
end
% 	1.NES_25 Function
function fit=NES_F25(x)
    y1=0.8*(x(1)^2+x(1)-1)*x(3)+0.12*x(1)^2+2.16*x(1)-0.12;
    y2=(1+x(1)^2)*x(4)+0.4*x(1)^2-1.6*x(1)-0.4;
    y3=(1+x(1)^2)*x(5)+x(1)^2-1;
    y4=(1+x(1)^2)*x(6)+0.8*(x(1)^2+x(1)-1);
    y5=x(3)*x(7)-0.02*x(6)-x(5)-x(3)*x(4)-0.16*x(4);
    y6=x(7)^2-2*x(4)*x(7)+x(6)^2+x(4)^2-x(2)^2;
    y7=x(8)-x(2)*x(3);
    y8=0.0476*x(3)*x(8)^12+x(3)-2.104;
    fit=y1^2+y2^2+y3^2+y4^2+y5^2+y6^2+y7^2+y8^2;
end
% 	1.NES_26 Function
function fit=NES_F26(x)
x1=x(1);x2=x(2);x3=x(3);x4=x(4);x5=x(5);x6=x(6);x7=x(7);x8=x(8);
y(1) = x1*x1 + x2*x2 -1.0;
y(2) = x3*x3 + x4*x4 -1.0;
y(3) = x5*x5 + x6*x6 -1.0;
y(4) = x7*x7 + x8*x8 -1.0;
y(5) = 4.731e-3*x1*x3 - 0.3578*x2*x3 - 0.1238*x1 + x7 - 1.637e-3*x2 - 0.9338*x4 - 0.3571;
y(6) = 0.2238*x1*x3 + 0.7623*x2*x3 + 0.2638*x1 - x7 - 0.07745*x2 - 0.6734*x4 - 0.6022;
y(7) = x6*x8 + 0.3578*x1 + 4.731e-3*x2;
y(8) = -0.7623*x1 + 0.2238*x2 + 0.3461;
fit=0;
for i=1:8
    fit=fit+y(i)^2;
end
end
% 	1.NES_27 Function
function fit=NES_F27(x)
 y1=x(5)+x(4)-1.803;
    y2=(x(2)+x(3))*x(5)+6.19116*x(4)-1.803*(1.497+0.035);
    y3=x(6)+x(4)-0.328;
    y4=0.28801*x(6)-x(2)*x(3)*x(5);
    y5=(-6.19116*x(1)+x(1)*x(3)+x(2)*x(5)-x(3)*x(5))*x(6)+x(1)*x(3)*x(5);
    y6=(1.803-0.232)*x(7)+x(4)-1.803;
    y7=x(8)-0.000856*x(7)^2;
    y8=(x(5)-x(1))*x(9)-x(1)*x(5);
    y9=x(9)-377*x(2)*x(8);
    fit=y1^2+y2^2+y3^2+y4^2+y5^2+y6^2+y7^2+y8^2+y9^2;
end
% 	1.NES_28 Function
function fit=NES_F28(x)
    y1=x(1)-0.25428722-0.18324757*x(4).*x(3).*x(9);
    y2=x(2)-0.37842197-0.16275449*x(1).*x(10).*x(6);
    y3=x(3)-0.27162577-0.16955071*x(1).*x(2).*x(10);
    y4=x(4)-0.19807914-0.15585316*x(7).*x(1).*x(6);
    y5=x(5)-0.44166728-0.19950920*x(7).*x(6).*x(3);
    y6=x(6)-0.14654113-0.18922793*x(8).*x(5).*x(10);
    y7=x(7)-0.42937161-0.21180486*x(2).*x(5).*x(8);
    y8=x(8)-0.07056438-0.17081208*x(1).*x(7).*x(6);
    y9=x(9)-0.34504906-0.19615740*x(10).*x(6).*x(8);
    y10=x(10)-0.42651102-0.21466544*x(4).*x(8).*x(1);
    fit=y1^2+y2^2+y3^2+y4^2+y5^2+y6^2+y7^2+y8^2+y9^2+y10^2;
end
% 	1.NES_29 Function
function fit =NES_F29(x)
temp=0;
for i=1:size(x,2)
    temp=temp+x(i)^2;
end
y1=temp-1.0;
temp=0;
for i=3:size(x,2)
    temp=temp+x(i)^2;
end
y2=abs(x(1)-x(2))+temp;
fit=y1^2+y2^2;
end
% 	1.NES_30 Function
function fit=NES_F30(x)
n= size(x,2);
temp=sum(x,2);
for i=1:n-1
    y(i) = x(i) + temp - (n+1);
end
temp = 1.0;
for i=1:n
    temp =temp* x(i);
end
y(n)= temp-1.0;
fit=0;
for i=1:n
    fit=fit+y(i)^2;
end
end
% 	1.NES_31 Function
function fit=NES_F31(x)
y1=x(1)+x(2)+x(3)-1;
y2=x(1)-x(2)^3;
fit=y1^2+y2^2;
end
% 	1.NES_32 Function
function fit=NES_F32(x)
y(1)=x(1)^2+ x(3)^2-1;
y(2)=x(2)^2+ x(4)^2-1;
y(3)=x(5)*x(3)^3+ x(6)*x(4)^3;
y(4)=x(5)*x(1)^3+ x(6)*x(2)^3;
y(5)=x(5)*x(1)*x(3)^2+ x(6)*x(4)^2*x2;
y(6)=x(5)*x(1)^2*x(3)+ x(6)*x(2)^2*x4;
fit=0;
for i=1:6
    fit=fit+y(i)^2;
end
end
% 	1.NES_33 Function
function fit=NES_F33(x)
n= size(x,2);
for i=1:n-1
    temp=0;
    for j=1:n-i-1
        temp=temp+x(j)*x(j+i);
    end
    y(i) = (x(i) + temp)*x(n);
end
temp=sum(x,2);
y(n)= temp-x(n)+1.0;
fit=0;
for i=1:n
    fit=fit+y(i)^2;
end
end

% 	1.NES_34 Function
function fit=NES_F34(x)
y(1)=x(2) + 2*x(6) + x(9) + 2*x(10)-10^-5;
y(2)=x(3) + x(8)-3*10^-5;
y(3)=x(1) + x(3) + 2*x(5) + 2*x(8) + x(9) + x(10)-5*10^-5;
y(4)=x(4) + 2*x(7)-10^-5;
y(5)=0.5140437*10^-7*x(5)-x(1)^2;
y(6)=0.1006932*10^-6*x(6)-2*x(2)^2;
y(7)=0.7816278*10^-15*x(7)-x(4)^2;
y(8)=0.1496236*10^-6*x(8)-x(1)*x(3);
y(9)=0.6194411*10^-7*x(9)-x(1)*x(2);
y(10)=0.2089296*10^-14*x(10)-x(1)*x(2)^2;
fit=0;
for i=1:10
    fit=fit+y(i)^2;
end
end
% 	1.NES_35 Function
function fit=NES_F35(x)
R=10;
R5=0.193;
R6=0.002597/sqrt(40);
R7=0.003448/sqrt(40);
R8=0.00001799/40;
R9=0.0002155/sqrt(40);
R10=0.00003846/40;
y(1)=x(1)*x(2) + x(1)-3*x(5);
y(2)=2*x(1)*x(2)+ x(1) + x(2)*x(3)^2+ R8*x(2)- R*x(5) + 2*R10*x(2)^2+ R7*x(2)*x(3) + R9*x(2)*x(4);
y(3)=2*x(2)*x(3)^2+ 2*R5*x(3)^2- 8*x(5)+ R6*x(3) + R7*x(2)*x(3);
y(4)=R9*x(2)*x(4)+ 2*x(4)*x(4)- 4*R*x(5);
y(5)=x(1)*(x(2)+ 1)+ R10*x(2)^2+ x(2)*x(3)^2+ R8*x(2)+ R5*x(3)^2+ x(4)^2- 1+ R6*x(3)+ R7*x(2)*x(3)+ R9*x(2)*x(4);
fit=0;
for i=1:5
    fit=fit+y(i)^2;
end
end










