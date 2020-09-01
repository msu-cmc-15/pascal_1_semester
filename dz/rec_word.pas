var
	f: text;
	c : char;

function make_s(s : string): string;
	begin
		read(f, c);
		if (eof(f)) then begin
			make_s := s + c;
			exit;
		end;
		if (c = ' ') then begin
			make_s := s;
			exit;
		end;
		s := s + c;
		make_s := make_s(s);
	end;

procedure getc;
	var
		s: string;
	begin
		if (eof(f)) then 
			exit;
		s := '';
		read(f, c);
		if (c = ' ') then
			getc()
		else begin
			s := s + c + make_s('');
			getc();
			write(s, ' ');
		end;
	end;

begin
	assign(f, 'input.txt');
	reset(f);
	getc();
	writeln();
end.