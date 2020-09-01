function tree_path(t : tree, e : integer): integer;
var
	q: queue;
	now_t : tree;
	now_level : integer;
begin
	tree_path := -1;
	erase(q);
	now_level := 0;
	push(q, t);
	while (not empty(q)) do begin
		while (not empty(q)) do begin
		now_t := pop(q);
		if (now_t <> nil) then begin
			if (now_t^.elem = e) then begin
				tree_path := now_level;
				exit;
				end;
			end;
		end;
		push(q, t^.left);
		push(q, t^.right);
		inc(now_level);
	end;
end;