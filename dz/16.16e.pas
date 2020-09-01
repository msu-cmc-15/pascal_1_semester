procedure Delete (var X:Ttext; i:integer);
	var
		j: integer;
begin
	if (i <= n) and (i > 0) and (X[i] <> nil) then begin
		j := i;
		dispose(X[i]);
		while (j < n) and (X[j + 1] <> nil) do begin
			X[j] := X[j + 1];
			inc(j);
		end;
		X[j] := nil;
	end
end;