program leer;
uses
  sysutils;
type
  f = file of char;
  alf = array ['a'..'z'] of integer;

procedure agregar(letter: char; var v: alf);
begin
	v[letter]:= v[letter] + 1;
end;

procedure inicializar(var v: alf);
  var
    i: char;
  Begin
    for i:='a' to 'z' do
      v[i]:= 0;
  end;

procedure contar( var v: alf; var c:longint; num: integer);
  var
    i: char;
  Begin
    for i:='a' to 'z' do
	  if  v[i] = num then
	  begin
		c:= c+1;
	  end;
  end;
Procedure ImprimirVector (v:alf);
  var
    i:char;
  Begin
    for i:='a' to 'z' do
      write(i,' : ',v[i],' | ' );
  end;
var
  file_name: f;
  preg: char;
  count: longint;
  a: alf;
  total: longint;
  num: integer;
begin
  count:=0; 
  total:=0;
  num:=0;
  inicializar(a);
  assign(file_name, 'input6.txt');
  reset(file_name);
  while not(eof(file_name))do begin
    read(file_name, preg);
    agregar(preg, a);
    if (preg = #10) and not(eof(file_name)) then
    begin
        read(file_name, preg);
    	agregar(preg, a);
    	num:=num+1;
        if (preg = #10) and not(eof(file_name)) then
        begin
			write(num);
	        contar(a,count,num);
			total:= total + count;
			count:=0;
			num:=0;
			inicializar(a);
	    end
	end;
  end;
  write('el total para todos los grupos es ',total);
  close(file_name);
  end.
