program example2;
begin
eps:=0.001;
while eps>0.00001 do
 begin
 x:=-0.6;
 writeln('EPS= ',eps:2:7);
 while x<0.41 do
  begin
   f2:=0; f21:=0; k:=1; sum2:=0; N:=1;
   st1:=(-1)*(-1);
   st2:=x*x*x;
   f1:=0.5*arctan(x)*ln(1+x*x);
   repeat
     f2:=f21;
     sum2:=sum2+1/(2*k-1)+1/(2*k);
     f21:=f21+((st1*st2)/(2*k+1)*sum2);
     st1:=st1*(-1);
     st2:=st2*x*x;
     k:=k+1;
     N:=N+1;
   until abs(f21-f2)<eps;
   writeln('   x= ',x:2:4,'    f1= ',f1:2:5,'    f2= ',f2:4:6,'    N= ',N);
   x:=x+0.05;
   x:=round(x/0.00000001)*0.00000001;
  end;
  eps:=eps*0.1;
 end;
end.