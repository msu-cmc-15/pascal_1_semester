var
	max_l, l, i, max: integer;
	f : text;
	s : String;
	c : Char;
begin
	assign(f, '1.txt');
	max := 0;
	l := 1;
	reset(f);
	while (not eof(f)) do begin
		i := 0;
		while (not eoln(f)) do begin
			read(f, c);
			inc(i);
		end;
		if (i > max) then begin
			max := i;
			max_l := l;
		end;
		inc(l);
		Readln(f);
	end;
	close(f);

	assign(f, '1.txt');
	reset(f);
	l := 1;
	while (not eof(f)) do begin
		if (l <> max_l) then 
			while (not eoln(f)) do
				read(f,c)
		else begin
			while (not eoln(f)) do begin
				read(f, s);
				write(s);
			end;
			exit;
		end;
		Readln(f);
		inc(l);
	end;
	close(f);
end.

