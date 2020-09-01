type
	expression = record
		open : integer;
		close : integer;
	end;
	stack = record
		head : integer;
		a : array[0..149] of expression;
	end;

procedure push(var s : stack; x : expression);
	begin
		inc(s.head);
		s.a[s.head] := x;
	end;

function is_empty(var s : stack) : Boolean;
	begin
		is_empty := s.head = -1;
	end;

function pop(var s : stack) : expression;
	begin
		pop := s.a[s.head];
		dec(s.head);
	end;

var
	tmp, res: stack;
	elem : expression;
	i : integer;
	f : text;
	s : string;

begin
	tmp.head := -1;
	res.head := -1;
	assign(f, 'input.txt');
	reset(f);
	readln(f, s);
	for i := length(s) downto 1 do begin
		if (s[i] = '(') then begin
			elem := pop(tmp);
			elem.open := i;
			push(res, elem);
		end
		else if (s[i] = ')') then begin
			elem.close := i;
			elem.open := -1;
			push(tmp, elem);
		end;
	end;
	while (not is_empty(res)) do begin
		elem := pop(res);
		write(elem.open, ' ', elem.close, '; ');
	end;
	writeln();
	close(f);
end.