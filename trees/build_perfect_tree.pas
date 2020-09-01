procedure build_(var t : tree; left, right : Integer);
begin
	t := nil;
	if (right - left < 1) then 
		exit;
	new(t);
	t^.elem := left + (right - left) / 2 + 1;
	build_(t, left, t^.elem - 1);
	build_(t, t^.elem, right);
end;

//вызываем ее
procedure build(var t : tree; n : Integer);
begin
	new(t);
	t^.elem := n div 2 + 1;
	build_(t, 0, n div 2);
	build_(t, n div 2, n);
end;
