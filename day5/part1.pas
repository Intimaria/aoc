program leer;
uses
  math;
type
  f = file of char;
  alf = array [1..10] of byte;
  sal = array [1..10] of char;

procedure inicializar(var v: alf);
  var
    i: byte;
  Begin
    for i:=1 to 10 do
		v[i]:=0
  end;

procedure binario(s: sal; var v: alf);
  var
    i: byte;
  Begin
    for i:=10 downto 1 do begin
	 if (s[i] = 'F') or (s[i] = 'L') then 
		v[i]:=0
	 else if (s[i] = 'B') or (s[i] = 'R') then
	    v[i]:= 1;
	 end;
  end;

procedure contar(v: alf; var num: longint);
  var
    i: byte; c: integer;
  Begin
    for i:=10 downto 1 do begin
		if v[i] = 1 then
		begin
			c := 2**(i-1);
			num:= num + c;
		end;
	 end;

  end;
  
Procedure ImprimirVector (v:alf);
  var
    i:byte;
  Begin
    for i:=10 downto 1 do
      write(v[i],' | ');
  end;
Procedure max (var max: longint; num: longint);
  Begin	
    if max < num then
      max:= num;
  end;
var
  file_name: f;
  l: char;
  s:sal;
  maxim: longint;
  a: alf;
  num: longint;
  i: byte;
begin
  maxim:=-1; 
  num:=0;
  inicializar(a);
  assign(file_name, 'input5');
  reset(file_name);
  while not(eof(file_name)) do begin
  	read(file_name, l);
  	i:=1;
	for i:= 10 downto 1 do begin
	    s[i]:=l;
	    read(file_name, l);
	end;
	binario(s, a);
	ImprimirVector(a);
	writeln();
	writeln('-----------');
    contar(a, num);
	writeln('num', num);
    max(maxim,num);
    writeln('max', maxim);
    inicializar(a);
    num:=0;
  end;
  write('max es ', maxim);
  close(file_name);
  end.
