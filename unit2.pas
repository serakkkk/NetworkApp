unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, LCLType,ShellApi,Windows,crt;

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
var
   ip: string;
   paquetes: string;
begin
  ip:=Form2.Edit1.Text;
  paquetes:=Form2.Edit2.Text;

  ShellExecute(0, 'open','cmd.exe',pchar('/k ping -n '+paquetes+' '+ip+''), nil, SW_SHOWNORMAL);
  showmessage('Se ha ejecutado el ping correctamente');
end;
/////////////////////////////////////////////////////////////

////////////Función ejecutar2/////////////////////////////
function ejecutar2: string;
var
   ip2: string;
   paquetes2: string;

begin
  ip2:=Form2.Edit1.Text;
  paquetes2:=Form2.Edit2.Text;
  ShellExecute(0, 'open','cmd.exe',pchar('/k ping -n '+paquetes2+' '+ip2+'> ./resumen_Ping.txt'), nil,0);
  showmessage('Espere unos segundos mientras se ejecuta y guardamos los resultados');
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

