// 17.7z
procedure add(var t : tree; key : Integer);
begin
	if (t = nil) then begin
		new(t);
		t^.e := key;
		t^.left := nil;
		t^.right := nil;
		exit;
	end;
	if (key > t^.e) then 
		add(t^.right, key)
	else if (key < t^.e) then
		add(t^.left, key);
end;

function build(var f : tf) : tree;
var 
	t : tree;
	i : Integer;
begin
	t := nil;
	assign(f, 'input.txt');
	reset(f);
	while (not eof(f)) do begin
		read(i, f);
		add(t, i);
	end;
	close(f);
	build := tree;
end;