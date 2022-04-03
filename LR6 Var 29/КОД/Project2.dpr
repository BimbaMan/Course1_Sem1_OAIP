program Project2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Var
str, lastword :string;
i, k :integer;
flag :boolean;

begin
 repeat        //Проверка на ввод
  flag:=true;
  write('Введите строку: ');
  readln(str);
  for i := 1 to length(str) do
  begin
   if ((str[i] < 'A') or (str[i] > 'Z')) and ((str[i] < 'a') or (str[i] > 'z')) and (str[i]<>' ') then
   begin
    flag:=false; writeln('Строка введена не корректно, попробуйте ещё'); break;
   end;
  end;
 until flag=true;

 str:=trim(str);               //удаление пробелов ванчале и в конце
 lastword:='';
  for i := length(str) downto 1 do     //Ищем последнее слово
    begin
      if str[i]=' ' then
        break;
    end;
 k := length(str) - (i-1)-1;
 lastword := copy(str,i+1,k);
writeln('Последнее слово: ',lastword);



readln;
end.
