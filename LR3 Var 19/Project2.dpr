program Project2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Math;

var
 x, eps, f1, f2, st1, st2, st3, fact1, fact2 :double;
 k, N, j, i :integer;
begin
    writeln('----------------------------------------------------------------------------------------------');
    writeln('|  X    |    f1      |     E=0.01            |      E=0.001          |       E=0.0001        |');
    writeln('|       |            |-----------------------|-----------------------|-----------------------|');
    writeln('|       |            |      f2(x)         |N |    f2(x)           |N |     f2(x)          |N |');
    writeln('----------------------------------------------------------------------------------------------');
 x:=-0.06;
 for i := 1 to 20 do
  begin
   f1:=ln(x+sqrt(1+x*x))/sqrt(1+x*x);
   write('|',x:6:3,' |',f1:12:7,'|');
   eps:=0.01;
   st1:=1; st2:=1; st3:=x; fact1:=1; fact2:=1;
   f2:=0; k:=0; N:=1;
   for j := 1 to 3 do
   begin
    while abs(f2)>eps do
     begin
     f2:=(st1*st2*fact1*fact1*st3)/fact2;
     st1:=st1*(-1); st2:=st2*2*2; st3:=st3*x*x;
     k:=k+1;
     fact1:=fact1*k; fact2:=fact2*(fact2+1)*(fact2+1);
     N:=N+1;
    end;
    eps:=eps*0.1;
     write(f2:20:16,'|',N,' |')
   end;
   writeln;
   x:=x+0.005;
   x:=round(x/0.00000001)*0.00000001;
  end;
readln;
end.
