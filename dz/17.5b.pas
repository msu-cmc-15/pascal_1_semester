type
	stack = record
		head : integer;
		a : array[0..149] of integer;
	end;
	fc = text;

procedure push(var s : stack; x : integer);
	begin
		inc(s.head);
		s.a[s.head] := x;
	end;

function is_empty(var s : stack) : Boolean;
	begin
		is_empty := s.head = -1;
	end;

function pop(var s : stack) : integer;
	begin
		if (is_empty(s)) then
			pop := -1
		else begin
			pop := s.a[s.head];
			dec(s.head);
		end;
	end;

var
	s: stack;
	i : integer;
	f : fc;
	c : char;

begin
	s.head := -1;
	assign(f, 'input.txt');
	reset(f);
	i := 1;
	while (not (eof(f))) do begin
		read(f, c);
		if (c = '(') then 
			push(s, i)
		else if (c = ')') then begin
			write(pop(s), ' ');
			write(i, '; ');
		end;
		inc(i);
	end;
	writeln();
	close(f);
end.
