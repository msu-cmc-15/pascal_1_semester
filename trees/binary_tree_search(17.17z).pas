function search(t : tree; key : Integer):Boolean;
begin
	search := false;
	if (t = nil) then
		exit;
	if (t^.key = key) then
		search := true
	else if (key > t^.key) then
		search := search(t^.right, key)
	else
		search := search(t^.left, key);
end;
