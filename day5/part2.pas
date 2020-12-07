program leer2;
uses
  math;
const 
{from preprocessing 
count=0;while not(eof(file)) do begin 
read(file, line); 
writeln(line);
count:=count+1; 
end; etc. gave me these values}
  dimF = 815; 
  firstNum = 96;
type
  f = file of char;
  alf = array [1..10] of byte;
  sal = array [1..10] of char;
  asientos = array [1..dimF] of integer;

procedure inicializar(var v: alf);
  var
    i: byte;
  Begin
    for i:=1 to 10 do
		v[i]:=0;
  end;

procedure iniAsientos(var v: asientos);
  var
    i: integer;
  Begin
    for i:=1 to dimF do
		v[i]:=i+firstNum;
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
  
procedure ordenarVector (var v: asientos);
var
	i, j, elem: integer;
begin
	for i:= 2 to dimF do
	begin
		elem:= v[i];
		j:=i-1;
		while (j > 0) and (v[j] > elem) do
		begin
			v[j+1]:=v[j];
			j:= j-1;
		end;
		v[j+1]:=elem;
	end;
end;

procedure max (var max: longint; num: longint);
  begin	
    if max < num then
      max:= num;
  end;
  
function compararAsientos( a:asientos; a2: asientos): integer;
var i:integer;
begin
	for i:= 1 to dimF do begin 
	  if a[i] > a2[i] then begin
		  writeln('encontre', a2[i]);
		 	compararAsientos:=a2[i];
		 	exit;
	  end;
	end;
end;

var
  file_name: f;
  l: char;
  s:sal;
  a: alf;
  num: longint;
  i: byte;
  ind: integer;
  asi: asientos;
  asi2: asientos;
  miAsiento: integer;
begin
  ind:=1;
  num:=0;
  inicializar(a);
  iniAsientos(asi2);
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
	  writeln();
    contar(a, num);
    inicializar(a);
    ind:=ind+1;
    asi[ind]:=num;
    num:=0;
  end;
  ordenarVector(asi);
  miAsiento:=compararAsientos(asi, asi2);
  writeln('mi asiento es', miAsiento);
  close(file_name);
  end.