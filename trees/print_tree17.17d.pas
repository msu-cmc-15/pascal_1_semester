procedure write_right(t : tree, var f : text);
	begin
		if (t = nil) then
			exit;
		write_right(t^.right, f);
		write(f, t^.e);
		write_right(t^.left, f);
	end;

procedure write_tree_to_file(t : tree; var f : text);
	begin
		rewrite(f);
		write_right(t, f);
		close(f);
	end;