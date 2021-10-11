object Form1: TForm1
  Left = 222
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Generick zLib UnPacker 1.0 Alpha'
  ClientHeight = 412
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 108
    Top = 372
    Width = 93
    Height = 30
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 563
    Height = 352
    Caption = ' Generick zLib UnPacker 1.0 Alpha '
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 79
      Width = 137
      Height = 16
      Caption = 'First archive byte in file:'
    end
    object Label2: TLabel
      Left = 418
      Top = 324
      Width = 112
      Height = 13
      Caption = 'http://coffee-cup.3dn.ru/'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -10
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = Label2Click
    end
    object Label3: TLabel
      Left = 20
      Top = 325
      Width = 51
      Height = 16
      Caption = 'Autostat:'
    end
    object Edit1: TEdit
      Left = 20
      Top = 34
      Width = 523
      Height = 21
      Color = clBtnFace
      TabOrder = 0
      Text = 'D:\em008_64.dat'
      OnChange = Edit1Change
    end
    object SpinEdit1: TSpinEdit
      Left = 394
      Top = 73
      Width = 149
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object Memo1: TMemo
      Left = 20
      Top = 148
      Width = 523
      Height = 165
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object RadioButton1: TRadioButton
      Left = 20
      Top = 118
      Width = 198
      Height = 21
      Caption = 'User pointer metod'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 226
      Top = 118
      Width = 179
      Height = 21
      Caption = 'Auto pointer search metod'
      TabOrder = 4
    end
  end
  object Button2: TButton
    Left = 473
    Top = 372
    Width = 92
    Height = 30
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 10
    Top = 372
    Width = 92
    Height = 30
    Caption = 'Open'
    TabOrder = 3
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 40
    Top = 272
  end
end
