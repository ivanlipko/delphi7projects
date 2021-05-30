library dll;

{$R *.res}

// stdcall - ���������� �� �������� ���������� � dll
// overload - ������, ��� � ��� ����� ��������� �������, � ����� ������,
//  �� ������ �����������, � �� �� ���� �����

function Sum(a,b : integer) : integer; stdcall;
begin
  Result := a + b;
end;

function Sub(a,b : integer) : integer; overload; stdcall;
begin
  Result := a - b;
end;

function Sub(a,b : real) : real; overload; stdcall;
begin
  Result := a - b;
end;

// ������ �������� �������:

//  ��������� name ��������, ��� �������� dll � ���� �������� �� ����� ���������
//  �� ����������� �����, ������� ��� ����� name. ��������, � SumIntegers, � �� � Sub.
exports
  Sum,
  Sub(a,b : integer) name 'SumIntegers',
  Sub(a,b : real) name 'SumFloats';

begin
end.


// ---------------------------------------------------
//� ���������� �������:

Project->Options, Directories\Conditions
�������� OutputDirectory = './exe'
��� ������, ��� ��������� ���������� ����� ������ � �������� 'exe'
