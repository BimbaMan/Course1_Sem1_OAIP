program Project2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Const
 n=1000;
Var
 b:array [1..n] of integer;
 n2:string;
 cod, n1, i, rab2, j, indmin, min, rab: integer;
 rab1 : real;


begin
 rab2:=1;
 cod:=1;
 while rab2<>0 do                 // �������� �� ����������� �������
 begin
  repeat
   write('������� ����������� (�� ����� ',n,') ������� N: ');     // �������� ������ ������
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
         write('������� ����������� (�� ����� ',n,') ������� N: ');          // �������� ������ ������  �����
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

 for i := 1 to n1 do                                   // ���� �� ������� � �������� �� ����
  begin
   repeat
    write('������� ',i,' ������� �������: ');
    readln(n2);
    val(n2,rab1,cod);
    if cod<>0 then writeln('Error, please try again');
   until cod=0;
   b[i]:=strtoint(n2);
  end;

  {randomize;                         // ���� ��������� ������� ��������
  for i := 1 to n1 do                 // �� �������, ������ ��� �����
    begin
     b[i]:=random(2000)-1000;
    end;}

  writeln;
  write('�������� ������: ');                //�������� ������ ����� �� �����
 for i := 1 to n1 do
   begin
    write(b[i],' ');
   end;

 for i := 1 to n1-1 do
   begin
    min:=b[i];
    indmin:=i;
    if b[i]>0 then                          //�������� ���� ����� �������������
     begin
     for j := i+1 to n1 do                  //���� �� ���������� ����� �������
      begin
       if (b[j]<min) and (b[j]>0) then      //�������� ��� ����������� ��������
       begin
        min:=b[j];
        indmin:=j;
       end;
      end;
      rab:=b[i];
      b[i]:=min;
      b[indmin]:=rab;
     end;

     if b[i]<0 then                         //�������� ���� ����� �������������
     begin                                  //���� ������������
       for j := i+1 to n1 do                //���� �� ���������� ����� �������
        begin
          if (b[j]>min) and (b[j]<0) then   //�������� ��� ����������� ��������
           begin
            min:=b[j];
            indmin:=j;
           end;
        end;
      rab:=b[i];                            //������������ ������ �������
      b[i]:=min;
      b[indmin]:=rab;
     end;
   end;
 writeln;
 writeln;
 write('���������� ������: ');              //����� ����������� �������
 for i := 1 to n1 do
   begin
    write(b[i],' ');
   end;
readln;
end.
