program Project2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Const
 n=1000;
Var
 A:array [1..n, 1..n] of integer;
 B:array [1..n*n] of integer;
 n2:string;
 rab1 : real;
 cod, n1, i, rab2, j: integer;
 x, y, d, s, k, numbB : integer;

 function IfThen(AC: Boolean; AT: Integer; AF: Integer): Integer;
 begin
  if AC=True then
   Result:=AT
  else
   Result:=AF;
 end;

begin
 rab2:=1;
 cod:=1;
 while rab2<>0 do                 // �������� �� ����������� �������
 begin
  repeat
   write('������� ����������� (�� ����� ',n,') ����������� ������� N: ');     // �������� ������ ������
   readln(n2);
   if length(n2)>4 then writeln('Error, please try again');
  until length(n2)<=4 ;
  while cod<>0 do           //  �������� ������ ���� ������� �������
   begin
    val(n2,rab1,cod);
    if cod<>0 then
    begin
     writeln('Error, please try again');
        repeat
         write('������� ����������� (�� ����� ',n,') ����������� ������� N: ');          // �������� ������ ������  �����
         readln(n2);
         if length(n2)>4 then writeln('Error, please try again');
        until length(n2)<=4 ;
    end;
   end;
  n1:=strtoint(n2);
  if (n1<=0) or (n1>1000) then       //�������� ������ ���� ������� ����� 0<=n>30000
   writeln('Error, please try again')
  else rab2:=0;
 end;

  {for i := 1 to n1 do           // ���� �� ������� � �������� �� ����
  begin
   for j := 1 to n1 do
   begin
    repeat
    write('������� [',i,', ',j,'] ������� �������: ');
    readln(n2);
    val(n2,rab1,cod);
    if cod<>0 then writeln('Error, please try again');
    until cod=0;
    A[i,j]:=strtoint(n2);
   end;
   end;}

  randomize;                         // ���� ��������� ������� ��������
  for i := 1 to n1 do
   for j := 1 to n1 do
    A[i,j]:=random(100);

  writeln;
  writeln('�������� ������: ');
  for i := 1 to n1 do
   begin
    for j := 1 to n1 do
    begin
    write(A[i,j]: 8,' ');
    end;
    writeln;
   end;

   {���������� B ������ ����� �� ������� A �������}
   if n1 mod 2=0 then
   begin
     x:=n1 div 2;
     y:=n1 div 2;
   end
   else
   begin
     x:=(n1 div 2)+1;
     y:=(n1 div 2)+1;
   end;
 d:=0; s:=1; numbB:=0;
 numbB:=numbB+1;
 B[numbB]:=A[x,y];
 for k := 1 to n1-1 do
  begin
   for j := 1 to IfThen(k<(n1-1),2,3) do
    begin
     for i := 1 to s do
       begin
         case d of
         0: x:=x+1;
         1: y:=y+1;
         2: x:=x-1;
         3: y:=y-1;
         end;
        numbB:=numbB+1;
        B[numbB]:=A[x,y];
       end;
    d:=(d+1) mod 4;
    end;

  s:=s+1;
  end;

writeln;
for i := 1 to n1*n1 do
write(B[i],' ');

readln;
end.
