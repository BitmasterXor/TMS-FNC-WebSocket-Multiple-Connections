object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 313
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object scListView1: TscListView
    Left = 0
    Top = 0
    Width = 535
    Height = 292
    FluentUIOpaque = False
    Columns = <
      item
        AutoSize = True
        Caption = 'IP Address'
      end
      item
        AutoSize = True
        Caption = 'NickName'
      end>
    ExtendedColumnDraw = False
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 1
    ViewStyle = vsReport
    SelectionStyle = scstStyled
    ShowFocusRect = True
    AlternateRow = False
    GridLines = False
    DefaultDraw = False
    SelectionColor = clNone
    SelectionTextColor = clHighlightText
    OnClick = scListView1Click
  end
  object serversocket: TTMSFNCWebSocketServer
    Left = 24
    Top = 40
    Width = 26
    Height = 26
    Visible = True
    AutoSyncEvents = False
    OnBinaryDataReceived = serversocketBinaryDataReceived
    OnDisconnect = serversocketDisconnect
  end
  object scStatusBar1: TscStatusBar
    Left = 0
    Top = 294
    Width = 724
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Panels = <
      item
        Text = 'Server Status: Offline!'
        Width = 150
      end
      item
        Text = 'Clients Online [0]'
        Width = 50
      end>
    UseSystemFont = False
  end
  object scImage1: TscImage
    Left = 535
    Top = 0
    Width = 189
    Height = 129
    FluentUIOpaque = False
    TabOrder = 3
    CustomImageIndex = -1
    DragForm = False
    DragTopForm = True
    StyleKind = scpsPanel
    ShowCaption = False
    BorderStyle = scpbsNone
    WallpaperIndex = -1
    LightBorderColor = clBtnHighlight
    ShadowBorderColor = clBtnShadow
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 7
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Caption = 'scImage1'
    StorePaintBuffer = False
    WordWrap = False
    Stretch = True
  end
  object scListView2: TscListView
    Left = 535
    Top = 135
    Width = 189
    Height = 157
    FluentUIOpaque = False
    Columns = <
      item
        Caption = '                 Information'
        Width = 185
      end>
    ExtendedColumnDraw = False
    TabOrder = 4
    ViewStyle = vsReport
    SelectionStyle = scstStyled
    ShowFocusRect = True
    AlternateRow = False
    GridLines = False
    DefaultDraw = False
    SelectionColor = clNone
    SelectionTextColor = clHighlightText
  end
  object PopupMenu1: TPopupMenu
    Left = 96
    Top = 32
    object S1: TMenuItem
      Caption = 'Send To ALL'
      OnClick = S1Click
    end
    object S2: TMenuItem
      Caption = 'Send To Selected'
      OnClick = S2Click
    end
  end
end
