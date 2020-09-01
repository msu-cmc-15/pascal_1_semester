function Same (L1,L2:Tlist):Boolean;
begin
	Same := true;
	if (L1 = nil) and (L2 = nil) then
		exit;
	if ((L1 = nil) and (L2 <> nil)) or ((L1 <> nil) and (L2 = nil)) then begin
		Same := false;
		exit;
	end;
	if (L1^.Data = L2^.Data) then
		Same := Same(L1^.next, L2^.next)
	else
		Same := false;
end;
