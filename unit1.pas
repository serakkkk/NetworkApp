unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls,Windows, Messages, WinSock,  WinInet,Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

    procedure Label2Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

//FUNCIONES QUE USAREMOS POSTERIORMENTE

///////////Función nombre equipo en la red/////////////////
function LeerNombrePC: string;
var
  Buffer: array[0..255] of char;
  dwLongitud: DWord;
begin
  dwLongitud := 256;

  if GetComputerName( Buffer, dwLongitud ) then
    Result := Buffer
  else
    Result := '' ;
  showmessage('El nombre del equipo en la red es: '+Result);
end;
//////////////////////////////////////////////////////////////


//////////Valor de la IP Local/////////////////////////////
function IPLocal: String;
var
  p: PHostEnt;
  s: array[0..128] of char;
  p2: pchar;
  wVersionRequested: WORD;
  wsaData: TWSAData;
begin
  // Arranca la librería WinSock
  wVersionRequested := MAKEWORD( 1, 1 );
  WSAStartup( wVersionRequested, wsaData );

  // Obtiene el nombre del PC
  GetHostName( @s, 128 );
  p := GetHostByName( @s );

  // Obtiene la dirección IP y libera la librería WinSock
  p2 := iNet_ntoa( PInAddr( p^.h_addr_list^ )^ );
  Result := Result + p2;
  WSACleanup;
  showmessage('La IP Local es: '+Result);
end;
////////////////////////////////////////////////////////////


////////////Nombre del usuario/////////////////////////////
function LeerUsuarioWindows: string;
var
  sNombreUsuario: String;
  dwLongitudNombre: DWord;
begin
  dwLongitudNombre := 255;
  SetLength( sNombreUsuario, dwLongitudNombre );

  if GetUserName( PChar( sNombreUsuario ), dwLongitudNombre ) Then
    Result := Copy( sNombreUsuario, 1, dwLongitudNombre - 1 )
  else
    Result := 'Desconocido';

  showmessage('El nombre del usuario actual es: '+Result);
end;
/////////////////////////////////////////////////////////////



///////////Comprobar si hay internet///////////////////////
function HayInternet: Boolean;
var
  Estado: Cardinal;
begin
  Estado := INTERNET_CONNECTION_MODEM;
  Result := InternetGetConnectedState(@Estado, 0);
end;
/////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////
procedure TForm1.Label2Click(Sender: TObject);//Imagen soporte aplicación
begin
     showmessage('Aquí se programará el envio de un correo de soporte');
end;

procedure TForm1.Button2Click(Sender: TObject); //Botón IP Pública
begin
     showmessage('Aquí se programará la información de la ip pública');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
         if HayInternet then
         ShowMessage('Estas conectado a internet')
    else
    ShowMessage('Estas desconectado de internet');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form2.Show;
end;



procedure TForm1.Button1Click(Sender: TObject); //Botón configuración local
begin
    LeerNombrePC;
    IPLocal;
    LeerUsuarioWindows;

end;

end.

