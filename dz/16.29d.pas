procedure Move_First_to_End(var L:Tlist);
	var
		tmp: Tlist;
		t : real;
	begin
		if (L = nil) or (L^.next = nil) then
			exit;
		tmp := L;
		while (tmp^.next <> nil) do
			tmp := tmp^.next;
		new(tmp^.next);
		tmp^.next^.Data := L^.Data;
		tmp^.next^.next := nil;
		tmp := L;
		L := L^.next;
		dispose(tmp);
	end;