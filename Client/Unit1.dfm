object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 65
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 2
    Top = 37
    Width = 255
    Height = 25
    Caption = 'Connect'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 2
    Top = 8
    Width = 255
    Height = 23
    TabOrder = 2
  end
  object ClientSocket: TTMSFNCWebsocketClient
    Left = 8
    Top = 8
    Width = 26
    Height = 26
    Visible = True
    OnConnect = ClientSocketConnect
    OnMessageReceived = ClientSocketMessageReceived
  end
  object pingtimer: TTimer
    Enabled = False
    OnTimer = pingtimerTimer
    Left = 280
    Top = 8
  end
  object Connectiontimer: TTimer
    Enabled = False
    Interval = 6000
    OnTimer = ConnectionTimerTimer
    Left = 128
    Top = 8
  end
end
