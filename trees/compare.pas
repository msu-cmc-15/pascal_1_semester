function compare(t1, t2 : tree): Boolean;
begin
	compare := true;
	if (t1 = nil) and (t2 = nil) then
		exit;
	if (t1 = nil) or (t2 = nil) then
		compare := false
	else if (t1^.e = t2^.e) and compare(t1^.left, t2^.left) and compare(t1^.right, t2^.right) then
		compare := true;
end;