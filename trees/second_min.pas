function second_min(t : tree): Integer;
begin
	second_min := t^.e;
	while (t^.left) do begin
		second_min := t^.e;
		t := t^.left;
	end;
	
	if (t^.right = nil) then
		exit;
	t := t^.right;
	while (t^.left <> nil) do 
		t := t^.left;
	second_min := t^.elem;
end;
