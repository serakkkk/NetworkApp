unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, LCLType;

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
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);

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

///////////Proceso de aviso de marcar boton para guardar datos/////////////////
procedure TForm2.CheckBox1Click(Sender: TObject);

var  tipo: TMsgDlgType;
     botones: TMsgDlgButtons;

begin



    tipo := mtWarning;
    botones:= [mbOK];
    MessageDlg ('Aviso', 'Si mandas muchos paquetes el fichero puede tardar en crearse y ralentizar el ordenador', tipo, botones,0);

end;

////////////////////////////////////////////////////////////////////////////////

////////////Función ejecutar1/////////////////////////////
function ejecutar1: string;
begin
  showmessage('No esta marcado');
end;
/////////////////////////////////////////////////////////////

////////////Función ejecutar2/////////////////////////////
function ejecutar2: string;
begin
  showmessage('Esta marcado');
end;
/////////////////////////////////////////////////////////////

//////////VAMOS A DECLARAR LO QUE HARA EL BOTON REALIZAR PING //////////////////
procedure TForm2.Button1Click(Sender: TObject);
begin
  If checkbox1.state=cbunchecked then ejecutar1
  else ejecutar2;

end;
/////////////////////////////////////////////////////////////////


end.

