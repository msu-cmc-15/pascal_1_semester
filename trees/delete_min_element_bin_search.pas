procedure del(var t : tree);
var
	p, q : tree;
begin
	if (t = nil) then
		exit;
	if (t^.left = nil) then begin
		p := t;
		t := t^.right;
		dispose(p);
	end
	else begin
		p := t;
		while (p^.left <> nil) do begin
			q := p;
			p := p^.left;
		end;

		q^.left := p^.right;
		dispose(p);	
	end;
end;