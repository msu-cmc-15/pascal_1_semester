var
	min: longint = 9;
	f : Boolean = true;
	n : longint;

procedure min_(n : longint);
	begin
		if ((n mod 10) < min) then 
			min := n mod 10;
		if (n > 10) then 
			min_(n div 10);
		f := false;
	end;

function delmin(n : longint): longint;
	begin
		if (f) then
			min_(n);
		if (n mod 10 <> min) then 
			if (n > 10) then 
				delmin := delmin(n div 10) * 10 + (n mod 10)
			else
				delmin := n
		else
			delmin := n div 10;
	end;


begin
	readln(n);
	writeln(delmin(n));
end.