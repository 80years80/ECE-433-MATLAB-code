%Ybus based on zero sequence circuit
YZeroBus = [ -20i, 0, 0, 0, 0;
             0, -3i, 0, 1i, 2i;
             0, 0, -18.1818i, 0, 0;
             0, 1i, 0, -24.33i, 3.33i;
             0, 2i, 0, 3.33i, -30.333i;
             ];
         
 %Positive and negative sequence circuit are the same
 %in terms of producing the same Ybus values.
 %So Ybus positive = Ybus negative
 
 YPosBus = [ -37.5i, 0, 0, 0, 25i;
             0, -9.821i, 0, 3.57i, 6.25i;
             0, 0, -40i, 20i, 0;
             0, 3.57i, 20i, -48.57i, 25i;
             25i, 6.25i, 0, 25i, -56.25i;
             ];
         
 YNegBus = YPosBus;
 
%disp(inv(YZeroBus));
%disp(inv(YPosBus));

%Using eq 9.5.3 from the book. 
ZBusZero = inv(YZeroBus);
ZBusPos = inv(YPosBus);
ZBusNeg = ZBusPos;
Vf = 1.028;
Zf = 0;

b = (sqrt(3)/2);
a = -0.5 + b*1i;

A = [1, 1, 1;
     1, a^2, a;
     1, a, a^2;
    ];

 Is1 = [0; % I0
       0; % I1
       0; % I2
         ];
     
 Is2 = [0; % I0
       0; % I1
       0; % I2
         ];
 Is3 = [0; % I0
       0; % I1
       0; % I2
         ];
Is4 = [0; % I0
       0; % I1
       0; % I2
         ];
Is5 = [0; % I0
       0; % I1
       0; % I2
         ];
     
ZZeroPull = [ ZBusZero(1,1); ZBusZero(2,2); ZBusZero(3,3); ZBusZero(4,4);
              ZBusZero(5,5)];
ZPosPull = [ ZBusPos(1,1); ZBusPos(2,2); ZBusPos(3,3); ZBusPos(4,4); 
             ZBusPos(5,5)];
ZNegPull = ZPosPull;

Z = ZZeroPull(1)+ ZPosPull(1) + ZNegPull(1);
Is1(1) = Vf/Z;
Is1(2) = Vf/Z;
Is1(3) = Vf/Z;

Z = ZZeroPull(2)+ ZPosPull(2) + ZNegPull(2);
Is2(1) = Vf/Z;
Is2(2) = Vf/Z;
Is2(3) = Vf/Z;

Z = ZZeroPull(3)+ ZPosPull(3) + ZNegPull(3);
Is3(1) = Vf/Z;
Is3(2) = Vf/Z;
Is3(3) = Vf/Z;

Z = ZZeroPull(4)+ ZPosPull(4) + ZNegPull(4);
Is4(1) = Vf/Z;
Is4(2) = Vf/Z;
Is4(3) = Vf/Z;

Z = ZZeroPull(5)+ ZPosPull(5) + ZNegPull(5);
Is5(1) = Vf/Z;
Is5(2) = Vf/Z;
Is5(3) = Vf/Z;

Ip1 = A*Is1;
Ip2 = A*Is2;
Ip3 = A*Is3;
Ip4 = A*Is4;
Ip5 = A*Is5;

x1 = abs(Ip1(1));
x2 = abs(Ip2(1));
x3 = abs(Ip3(1));
x4 = abs(Ip4(1));
x5 = abs(Ip5(1));

a1 = angle(Ip1(1));
a2 = angle(Ip2(1));
a3 = angle(Ip3(1));
a4 = angle(Ip4(1));
a5 = angle(Ip5(1));

a1 = rad2deg(a1);
a2 = rad2deg(a2);
a3 = rad2deg(a3);
a4 = rad2deg(a4);
a5 = rad2deg(a5);

fprintf('Fault Bus 1    Fault current (%f/%f) \n', x1, a1);
fprintf('Fault Bus 2    Fault current (%f/%f) \n', x2, a2);
fprintf('Fault Bus 3    Fault current (%f/%f) \n', x3, a3);
fprintf('Fault Bus 4    Fault current (%f/%f) \n', x4, a4);
fprintf('Fault Bus 5    Fault current (%f/%f) \n', x5, a5);