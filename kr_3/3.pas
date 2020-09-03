var
	n : integer;

function chr1(n : integer): char;
	var
		i, j : char;
	begin
		i := 'a';
		j := 'a';
		while ((ord(i) <> n) and (ord(j) <> n)) do begin
			i := succ(i);
			j := pred(j);
		end;
		if (ord(i) = n) then 
			chr1 := i
		else
			chr1 := j;
	end;

begin
	readln(n);
	writeln(chr1(n));
end.