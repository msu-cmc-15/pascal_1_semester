var
	f: text;
	i, n: integer;
	c : char;
	s : String;
	st : array[0..999] of string;

begin
	assign(f, 'input.txt');
	reset(f);
	i := 0;
	while (not eof(f)) do begin
		read(f, c);
		if (c <> ' ') then begin
			while (c <> ' ') and (not eof(f)) do begin
				s := s + c;
				read(f, c);
			end;
			s := s + c;
			st[i] := s;
			inc(i);
			s := '';
		end;
	end;
	for n := i - 1 downto 0 do 
		write(st[n], ' ');
	writeln();
end.