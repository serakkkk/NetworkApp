unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    UpDown1: TUpDown;
    procedure Edit2Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Edit2Change(Sender: TObject);
begin

end;

end.

