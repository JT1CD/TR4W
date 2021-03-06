{
 Copyright Dmitriy Gulyaev UA4WLI 2015.

 This file is part of TR4W  (SRC)

 TR4W is free software: you can redistribute it and/or
 modify it under the terms of the GNU General Public License as
 published by the Free Software Foundation, either version 2 of the
 License, or (at your option) any later version.

 TR4W is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General
     Public License along with TR4W in  GPL_License.TXT. 
If not, ref: 
http://www.gnu.org/licenses/gpl-3.0.txt
 }
unit uDXSSpotsFilter;
{$IMPORTEDDATA OFF}
interface

uses
  TF,
  VC,
  Windows,
  uCommctrl,

  Messages;
const
  DXSSpotsFiltersCount             = 8;
var
  DXSSpotsFiltersArray             : array[0..DXSSpotsFiltersCount - 1] of PChar =
    (
    'SHOW/FILTER',
    'CLEAR/SPOTS ALL',
    'ACC/SPOTS ON HF',
    'ACC/SPOTS ON VHF',
    'ACC/SPOTS ON HF/CW',
    'ACC/SPOTS ON HF/SSB',
    'REJECT/ANNOUNCE',
    'CLEAR/ANNOUNCE'
    );

function DXSSpotsFilterDlgProc(hwnddlg: HWND; Msg: UINT; wParam: wParam; lParam: lParam): BOOL; stdcall;

implementation

uses MainUnit, uTelnet;

var
  DXSComandToSend                  : integer;

function DXSSpotsFilterDlgProc(hwnddlg: HWND; Msg: UINT; wParam: wParam; lParam: lParam): BOOL; stdcall;
label
  1;
var
  I                                : integer;
begin
  RESULT := False;
  case Msg of
    WM_INITDIALOG:
      begin
        DXSComandToSend := -1;
        for I := 0 to DXSSpotsFiltersCount - 1 do
        begin
          tCreateButtonWindow(
            0,
            DXSSpotsFiltersArray[I],
            BS_AUTORADIOBUTTON or WS_CHILD or WS_VISIBLE or WS_TABSTOP,
            10,
            I * 20 + 20,
            150,
            20,
            hwnddlg,
            I + 100);
        end;

      end;

    WM_COMMAND:
      begin
        if wParam = 1 then
        begin
          if DXSComandToSend <> -1 then SendViaSocket(DXSSpotsFiltersArray[DXSComandToSend]);
        end;
        if wParam = 2 then goto 1;
        if wParam in [100..DXSSpotsFiltersCount - 1 + 100] then DXSComandToSend := wParam - 100;
      end;
    WM_CLOSE: 1: EndDialog(hwnddlg, 0);
  end;
end;
end.

