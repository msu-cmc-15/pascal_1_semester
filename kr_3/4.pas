var
	c: char;
	s : integer;
begin
	s := 0;
	read(c);
	while (c <> '.') do begin
		s := (s * 10 + (ord(c) - ord('0') )) mod 11;
		read(c);
	end;
	writeln(s = 0);
end.