var
	i: integer = 1;
	str : String;
	c : Char;

procedure s() forward;
procedure m() forward;
procedure t() forward;

procedure getc();
	begin
		if (i <= length(str)) then begin
			c := str[i];
			inc(i);
		end
		else
			c := ' ';
	end;

procedure s();
	begin
		m();
		while c = '+' do begin
			getc();
			m();
			write('+');
		end;

		while c = '-' do begin
			getc();
			m();
			write('-');
		end;
	end;

procedure m();
	begin
		t();
			while (c = '*') do begin
				getc();
				t();
				write('*');
			end;
	end;

procedure t();
	begin
		if (c in ['a'..'z']) then 
			write(c)
		else begin
			getc();
			s();
		end;
		getc();
	end;

begin
	readln(str);
	getc();
	s();

end.