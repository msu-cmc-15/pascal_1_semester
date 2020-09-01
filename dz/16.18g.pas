function Max(L:Tlist):real;
begin
	Max := L^.Data;
	while (L <> nil) do begin
		if (L^.Data > Max) then 
			Max := L^.Data;
		L := L^.next;
	end;
end;