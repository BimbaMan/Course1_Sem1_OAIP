program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Math;

Var i, a, b : integer;

begin
 for i := 1 to 1000 do
  begin
   a:=i;
   b:=0;
    while a>0 do
    begin
     b:=b*10+(a mod 10);
     a:=a div 10;
    end;

    if b=i
     then
      begin
       a:=sqr(i);
       b:=0;
        while a>0 do
         begin
          b:=b*10+(a mod 10);
          a:=a div 10;
         end;
        if b=sqr(i)
         then writeln(i);
      end;
  end;
readln;
end.
