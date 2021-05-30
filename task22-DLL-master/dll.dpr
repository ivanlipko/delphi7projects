library dll;

{$R *.res}

// stdcall - соглашение по передаче параметров в dll
// overload - значит, что у нас будет несколько функций, с одним именем,
//  но разной реализацией, и мы об этом знаем

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

// секция Экспорта функций:

//  директива name означает, при загрузке dll к этим функциям мы можем обратится
//  по конкретному имени, которое идёт после name. Например, к SumIntegers, а не к Sub.
exports
  Sum,
  Sub(a,b : integer) name 'SumIntegers',
  Sub(a,b : real) name 'SumFloats';

begin
end.


// ---------------------------------------------------
//в настройках проекта:

Project->Options, Directories\Conditions
Параметр OutputDirectory = './exe'
Это значит, что результат компиляции будет лежать в подпапке 'exe'
