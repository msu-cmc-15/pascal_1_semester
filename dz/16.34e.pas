procedure Merge(L1,L2:Tlist; var L:Tlist);
	var
		prev, p, p1, p2: Tlist;
begin
	if (L1 = nil) and (L2 = nil) then
		exit;
	new(L);
	p := L;
	prev := L;
	p1 := L1;
	p2 := L2;
	while (p1 <> nil) and (p2 <> nil) do begin
		if (p1^.Data < p2^.Data) then begin
			p^.Data := p1^.Data;
			p1 := p1^.next;
		end 
		else begin
			p^.Data := p2^.Data;
			p2 := p2^.next;
		end;
		new(p^.next);
		prev := p;
		p := p^.next;
	end;

	while (p1 <> nil) do begin
		p^.Data := p1^.Data;
		p1 := p1^.next;
		new(p^.next);
		prev := p;
		p := p^.next;
	end;

	while (p2 <> nil) do begin
		p^.Data := p2^.Data;
		p2 := p2^.next;
		new(p^.next);
		prev := p;
		p := p^.next;
	end;
	dispose(p);
	prev^.next := nil;
end;