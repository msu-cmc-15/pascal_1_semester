function Same(var X:Tarray):Boolean; 
var
	i, j: Integer;
begin
	for i := 1 to n do 
		for j := i + 1 to n do 
			if (X[i]^ = X[j]^) then begin
				Same := true;
				exit;
			end;
	Same := false;
end;
