procedure build(var t : tree, n : integer);
	begin
		t := nil;
		if (n = 0) then
			exit;
		new(t);
		t^.e := n;
		build(t^.right, n - 1);
		build(t^.left, n - 1);
	end;