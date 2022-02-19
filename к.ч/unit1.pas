unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
  type

{ TComplex }

TComplex = class
private x, y: real;
public
//Объявление конструктора.
constructor Create(a,b:real);
function Modul():real;
function Argument():real;
function ComplexToStr(): String;
end;

var
  Form1: TForm1;
  chislo: TComplex;
implementation

{ TComplex }

constructor TComplex.Create(a, b: real);
begin
  x:=a; y:=b;
inherited Create;
end;

function TComplex.Modul(): real;
begin
  modul:=sqrt(x*x+y*y);
end;

function TComplex.Argument(): real;
begin
  argument:=arctan(y/x)*180/pi;
end;

function TComplex.ComplexToStr(): String;
begin
  if y>=0 then
ComplexToStr:=FloatToStrF(x,ffFixed,5,2)+
'+' + FloatTostrF(y,ffFixed,5,2)+ 'i'

else
ComplexToStr:=FloatTostrF(x,ffFixed,5,2)+
FloatTostrF(y,ffFixed,5,2)+ 'i'
end;

 //Конструктор, который получает
//в качестве входных параметров
//два вещественных числа и записывает
//их в действительную и мнимую части
//комплексного числа.
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
Var
Str1 : String;
x1, x2 : real;
begin
 x1:=StrToFloat(Edit1.Text);
x2:=StrToFloat(Edit2.Text);
chislo:=TComplex.Create(x1,x2);
chislo.x:=StrToFloat(Edit1.Text);
chislo.y:=StrToFloat(Edit2.Text);
Str1:='Kompleksnoe chislo '+

chislo.ComplexToStr() ;

Memo1.Lines.Add(Str1) ;
Str1:='Modul chisla '+
FloatToStrF(chislo.Modul(),ffFixed, 5, 2);
Memo1.Lines.Add(Str1) ;
Str1:='Argument chisla '+
FloatToStrF(chislo.Argument(),ffFixed, 5, 2);
Memo1.Lines.Add(Str1) ;
chislo.Free;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

end.

