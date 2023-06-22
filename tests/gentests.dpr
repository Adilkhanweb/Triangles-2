{$r+,q+,o-}
{$apptype console}
type
  int = longint;

var
  test_num: int;

procedure gen1(n: int; ok: boolean);
var
  x, y: array [1..110, 1..3] of int;
  xx, yy: array [1..3] of int;
  i, j, k, u, v: int;

begin
  inc(test_num);
  rewrite(output, chr((test_num div 10) + ord('0')) + chr((test_num mod 10) + ord('0')));

  x[1][1]:=0;
  y[1][1]:=0;
  for j:=2 to 3 do
  begin
    x[1][j]:=random(1000) + 1;
    y[1][j]:=random(1000) + 1;
  end;

  for i:=2 to n do
  begin
    for j:=1 to 3 do
    begin
      x[i][j]:=x[1][j];
      y[i][j]:=y[1][j];
    end;

    u:=random(3);
    for j:=1 to u do
    begin
      for k:=1 to 3 do
      begin
        xx[k]:=y[i][k];
        yy[k]:=1000 - x[i][k];
      end;

      for k:=1 to 3 do
      begin
        x[i][k]:=xx[k];
        y[i][k]:=yy[k];
      end;
    end;

    u:=random(3);
    for j:=1 to 3 do
    begin
      xx[(j + u + 2) mod 3 + 1]:=x[i][j];
      yy[(j + u + 2) mod 3 + 1]:=y[i][j];
    end;

    for j:=1 to 3 do
    begin
      x[i][j]:=xx[j];
      y[i][j]:=yy[j];
    end;
  end;

  for i:=1 to n do
  begin
    u:=random(1000) + 1;
    v:=random(1000) + 1;
    for j:=1 to 3 do
    begin
      x[i][j]:=x[i][j] + u;
      y[i][j]:=y[i][j] + v;
    end;
  end;

  if (not ok) then
  begin
    i:=random(n) + 1;
    for j:=1 to 3 do
      x[i][j]:=1000 - x[i][j];
  end;

  writeln(n);
  for i:=1 to n do
    writeln(x[i][1], ' ', y[i][1], ' ', x[i][2], ' ', y[i][2], ' ', x[i][3], ' ', y[i][3]);

  close(output);
end;

procedure gen2(n: int);
var
  i: int;

begin
  inc(test_num);
  rewrite(output, chr((test_num div 10) + ord('0')) + chr((test_num mod 10) + ord('0')));

  writeln(n);
  for i:=1 to n do
    writeln(random(9999) + 1, ' ', random(9999) + 1, ' ', random(9999) + 1, ' ', random(9999) + 1, ' ', random(9999) + 1, ' ', random(9999) + 1);

  close(output);
end;

begin
  randseed:=3611239;
  test_num:=9;
  gen1(5, true);
  gen1(5, false);

  gen1(10, true);
  gen1(20, true);
  gen1(25, false);
  gen1(30, true);
  gen1(35, true);
  gen1(40, false);
  gen1(45, false);
  gen1(50, true);
  gen1(56, true);
  gen1(62, false);
  gen1(67, false);
  gen1(77, true);
  gen1(87, false);
  gen1(97, true);
  gen1(100, true);
  gen1(100, true);
  gen1(100, false);
  gen1(100, false);
  gen1(100, true);
  gen2(100);
  gen2(100);
end.
