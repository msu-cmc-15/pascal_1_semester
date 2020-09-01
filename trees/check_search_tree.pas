procedure set_q(t : tree, var q: queue);
begin
	if (t = nil) then
		exit;
	push(q, t^.elem);
	set_q(t^.left, q);
	set_q(t^.right, q);
end;

function is_search(t : tree; e : Integer): Boolean;
var
	q1, q2: queue;
	tmp : integer;
	now_t : tree;
begin
	is_search := true;
	if (t = nil) then
		exit;
	erase(q1);
	push(q1, t);
	while (not empty(q1)) do begin
		while (not empty(q1)) do begin
		now_t := pop(q1);
		if (now_t <> nil) then begin
			erase(q2);
			set_q(now_t^.left, q2);
			while (not empty(q2)) do begin
				tmp := pop(q2);
				if (tmp > now_t^.elem) then begin
					is_search := false;
					exit;
				end;
			end;

			erase(q2);
			set_q(now_t^.right, q2);
			while (not empty(q2)) do begin
				tmp := pop(q2);
				if (tmp < now_t^.elem) then begin
					is_search := false;
					exit;
				end;
			end;
		end;
		push(q1, t^.left);
		push(q1, t^.right);
		end;
	end;
end;
