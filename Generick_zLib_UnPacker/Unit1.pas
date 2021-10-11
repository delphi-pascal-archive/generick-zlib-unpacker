unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, zlib, StdCtrls, Spin, shellapi;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

function Decompress_Zlib(const inStream, outStream :TStream; StartPos: integer):boolean;
  var
  Count: integer;
  ZStream: TDecompressionStream;
  Buffer: array [0..4096] of byte;
begin
  inStream.Seek(StartPos, soFromBeginning);
  outStream.Seek(0,soFromBeginning);
  ZStream:=TDecompressionStream.Create(InStream);
  try
   while true do
    begin
     Count:=ZStream.Read(Buffer, sizeof(buffer));
     if Count<>0
     then OutStream.WriteBuffer(Buffer, Count)
     else Break;
    end;
    Result:=True;
  Except
    Result:=False;
    ZStream.Free;
    exit;
  end;
  ZStream.Free;
end;

{$R *.dfm}
function GetFSize(Filename: string): int64;
var
  f: TFileStream;
begin
  try
    f := TFileStream.Create(Filename, fmShareDenyNone);
    result := f.Size;
  finally
    f.Free;
  end;
end;

function GenerickExtract(Filename: string; sPos: integer): boolean;
var
  f,f1: TFileStream;
begin
  result := false;
  try
    f  := TFileStream.Create(Filename, fmShareDenyRead);
    f1 := TFileStream.Create(Filename+'.unpk', fmCreate);
  except
    exit;
  end;
  try
    (* *)
    result := Decompress_Zlib(f, f1, sPos);
    (* *)
  finally
    f.Free;
    f1.Free;
  end;
end;

function GenerickAutoExtract(Filename: string): boolean;
var
  i: integer;
  size: int64;
begin
  Result := false;
  size := GetFSize(Filename);
  if size - 4096 < 0 then exit;

  for i := 0 to size - 4096 do begin
      form1.Label3.Caption := ('Pointer offset: '+IntToHex(i,8));
      Application.ProcessMessages;
      if GenerickExtract(Filename, i) then begin
          Form1.Memo1.Lines.Add('Found pointer offset (^_^): '+IntToHex(i,8));
          Result := true;
          exit;
      end;
  end;
  form1.Label3.Caption := ('Pointer offset: '+IntToHex(0,8));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    form1.Label3.Caption := ('Pointer offset: '+IntToHex(0,8));
    if RadioButton1.Checked then begin
        Memo1.Lines.Add('Start extract... ');
        Memo1.Lines.Add('File name: '+Edit1.Text);
        Memo1.Lines.Add('First archive byte: '+inttostr(SpinEdit1.Value));
        if GenerickExtract(Edit1.Text, SpinEdit1.Value) then
          Memo1.Lines.Add('Extracted complete! =)') else
          Memo1.Lines.Add('Extracting error! 0_o');
    end else begin
        Memo1.Lines.Add('Start extract... ');
        Memo1.Lines.Add('File name: '+Edit1.Text);
        Memo1.Lines.Add('First archive byte: Auto search');    
        if GenerickAutoExtract(Edit1.Text) then
          Memo1.Lines.Add('Extracted complete! =)') else
          Memo1.Lines.Add('Extracting error! 0_o');
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  form1.Label3.Caption := ('Pointer offset: '+IntToHex(0,8));
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
ShellExecute(0,'open','http://coffee-cup.3dn.ru/','','',1);
end;

end.
