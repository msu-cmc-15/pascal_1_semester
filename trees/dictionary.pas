type keyType = string[20];
	fc = text;
	tree = ^tnode;
	tnode = record
		key : keyType;
		left, right : tree;
		frequancy : integer;
	end;
	list = ^node;
	node = record
		elem : keyType;
		frequancy : integer;
		next : list;
	end;


procedure print_tree(t : tree);
begin
	if (t = nil) then
		exit;
	writeln(t^.key, ' – ', t^.frequancy);
	print_tree(t^.left);
	print_tree(t^.right);
end;

procedure add(var t : tree; key : keyType);
begin
	if (t = nil) then begin
		new(t);
		t^.key := key;
		t^.frequancy := 1;
		t^.left := nil;
		t^.right := nil;
		exit;
	end;
	if (key > t^.key) then
		add(t^.left, key)
	else if (key < t^.key) then
		add(t^.right, key)
	else
		inc(t^.frequancy);
end;

function build_tree(var f : fc; var n : Longint) : tree;
var
	t : tree;
	c : char;
	i : integer;
	s : string[20];
begin
	t := nil;
	s := '';
	i := 0;
	assign(f, 'input.txt');
	reset(f);
	while (not eof(f)) do begin
		read(f, c);
		inc(i);
		if (((c < 'A') or (c > 'z')) or (i >= 20)) and (s <> '') then begin
			// writeln(s);
			add(t, LowerCase(s));
			s := '';
			i := 0;
			inc(n);
		end
		else
			if ('A' <= c) and (c <= 'z') then begin
				s := s + c;
			end;
	end;
	if (s <> '') then begin
		add(t, LowerCase(s));
		inc(n);
	end;
	close(f);
	build_tree := t;
end;

procedure add_list(var l : list; key : string; frequancy : integer);
begin
	if (l = nil) then begin
		new(l);
		l^.elem := key;
		l^.frequancy := frequancy;
		l^.next := nil;
	end
	else
		add_list(l^.next, key, frequancy);
end;

procedure build_list(var l : list; t : tree);
begin
	if (t = nil) then
		exit;
	build_list(l, t^.left);
	add_list(l, t^.key, t^.frequancy);
	build_list(l, t^.right);
end;

procedure print_list(l : list; n : longint);
	var
		pr: real;
		i : integer;
begin
	i := 0;
	while (l <> nil) and (i < 100) do begin
		pr := (l^.frequancy / n) * 100;
		writeln(l^.elem, ' – ', l^.frequancy, ' Percentage – ', pr:2:2, '%');
		l := l^.next;
		inc(i);
	end;
end;

procedure sort_list(var l : list);
	var
		l1, l2, l_tmp: list;
		max : integer;
		word : string;
begin
	l1 := l;
	l2 := l;
	max := -1;
	while (l1 <> nil) do begin
		while (l2 <> nil) do begin
			if (l2^.frequancy > max) then begin
				max := l2^.frequancy;
				word := l2^.elem;
				l_tmp := l2;
			end;
			l2 := l2^.next;
		end;
		l_tmp^.frequancy := l1^.frequancy;
		l_tmp^.elem := l1^.elem;
		l1^.frequancy := max;
		l1^.elem := word;
		l1 := l1^.next;
		l2 := l1;
		max := -1;
	end;
end;

var
	f: fc;
	t : tree;
	n : Longint;
	words : list;
begin
	n := 0;
	t := build_tree(f, n);
	writeln(n, ' words in text');
	if (n = 0) then
		exit;
	build_list(words, t);
	sort_list(words);
	print_list(words, n);
end.
