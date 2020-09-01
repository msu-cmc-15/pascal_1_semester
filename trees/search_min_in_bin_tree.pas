function search_min(t : tree): Integer;
begin
	if (t^.left = nil) then
		search_min := t^.elem;
	else
		search_min := search_min(t^.left);
end;