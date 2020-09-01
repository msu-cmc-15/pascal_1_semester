function count(t : tree; n : integer): Integer;
begin
	if (t = nil) then begin
		count := 0;
		exit;
	end;

	if (n = 1) then 
		count := 1
	else begin
		dec(n);
		count := count(t^.left, n) + count(t^.right, n);
	end;
end;