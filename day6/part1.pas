program leer;
uses
  sysutils;
type
  f = file of char;
  alf = array ['a'..'z'] of boolean;

procedure agregar(letter: char; var v: alf);
begin
if v[letter] = false then
	v[letter]:= true;
end;

procedure inicializar(var v: alf);
  var
    i: char;
  Begin
    for i:='a' to 'z' do
      v[i]:= false;
  end;

procedure contar( var v: alf; var c:longint);
  var
    i: char;
  Begin
    for i:='a' to 'z' do
	  if  v[i] = true then
	  begin
		c:= c+1;
		writeln('el total para este grupo es ', c);
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
begin
  count:=0; 
  total:=0;
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
        if (preg = #10) and not(eof(file_name)) then
        begin
        	writeln('fin de grupo');
			ImprimirVector(a);
	        contar(a,count);
			total:= total + count;
			count:=0;
			inicializar(a);
	    end
	end;
  end;
  write('el total para todos los grupos es ',total);
  close(file_name);
  end.
