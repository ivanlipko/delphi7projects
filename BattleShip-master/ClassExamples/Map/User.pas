unit User;

interface


type
  TUser = class
    private
      name:string;   // ���������� ����� ������������\����������� ����� �����
      MyXod:Boolean;     // ��������� ���� ������� ������������
       //True - ��� ������������
       //False - ��� ����������
      MyShips:Byte;      // ���-�� �������� ������������
     public
       constructor Create;
       destructor Destroy; override;
       //
       procedure EntName(name_:string);    // ���� ����� ������������
       function WriteName:string; // ����� ����� ������������
       //
       procedure EntXod(Xod:Boolean);  // ��������� ��������� ���� ������������
       function WriteXod:Boolean; //����� ��������� ���� ������������
       //
       procedure EntShips(KolvoShips:byte); // ��������� ���������� ��������
       function WriteShips:byte; //����� �������� ���-�� �������� ������������
  end;

implementation

{ TUser }

constructor TUser.Create;
begin

end;

destructor TUser.Destroy;
begin

  inherited;
end;

procedure TUser.EntName(name_: string);
begin
 name:=name_;
end;

procedure TUser.EntShips(KolvoShips: byte);
begin
  MyShips:=KolvoShips;
end;

procedure TUser.EntXod(Xod: Boolean);
begin
  MyXod:=Xod;
end;

function TUser.WriteName: string;
begin
  Result:=name;
end;

function TUser.WriteShips: byte;
begin
  Result:=MyShips;
end;

function TUser.WriteXod: Boolean;
begin
  Result:=MyXod;
end;

end.
