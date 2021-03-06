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
unit uRussiaOblasts;

interface

uses
  Windows {,  CLCUtils};

type

//  CallString = string[CallstringLength];
//  Str2 = string[2];

  ResultRecord = record
    rrIndex: integer;
    rrScore: integer;
  end;

  RegionResultsRecord = record
    rrrNumberOfStations: integer;
    rrrSOResults: Byte;
    rrrMOResults: Byte;
    rrrSOArray: array[1..3] of ResultRecord;
    rrrMOArray: array[1..2] of ResultRecord;
    rrrScore: integer;
  end;

  RussianRegionType =
    (
    rtUnknownRegion,

    rtUA1A,
    rtUA1C,
    rtUA1N,
    rtUA1O,
    rtUA1P,
    rtUA1Q,
    rtUA1T,
    rtUA1W,
    rtUA1Z,

    rtUA2F,

    rtUA3A,
    rtUA3C,
    rtUA3E,
    rtUA3G,
    rtUA3I,
    rtUA3L,
    rtUA3M,
    rtUA3N,
    rtUA3P,
    rtUA3Q,
    rtUA3R,
    rtUA3S,
    rtUA3T,
    rtUA3U,
    rtUA3V,
    rtUA3W,
    rtUA3X,
    rtUA3Y,
    rtUA3Z,

    rtUA4A,
    rtUA4C,
    rtUA4L,
    rtUA4N,
    rtUA4H,
    rtUA4F,
    rtUA4W,
    rtUA4P,
    rtUA4S,
    rtUA4U,
    rtUA4Y,

    rtUA6A,
    rtUA6E,
    rtUA6H,
    rtUA6I,
    rtUA6J,
    rtUA6L,
    rtUA6P,
    rtUA6Q,
    rtUA6U,
    rtUA6W,
    rtUA6X,
    rtUA6Y,

    rtUA9A,
    rtUA9C,
    rtUA9F,
//    rtUA9G,
    rtUA9H,
    rtUA9J,
    rtUA9K,
    rtUA9L,
    rtUA9M,
    rtUA9O,
    rtUA9Q,
    rtUA9S,
    rtUA9U,
    rtUA9W,
    rtUA9X,
    rtUA9Y,
    rtUA9Z,

    rtUA0A,
//    rtUA0B,
    rtUA0C,
    rtUA0D,
    rtUA0F,
//    rtUA0H,
    rtUA0I,
    rtUA0J,
    rtUA0K,
    rtUA0L,
    rtUA0O,
    rtUA0Q,
    rtUA0S,
    rtUA0U,
    rtUA0W,
//    rtUA0X,
    rtUA0Y,
    rtUA0Z

    );

const

  RussianRegionsTypeIdArray             : array[RussianRegionType] of array[0..1] of Char =
    (
    #0#0,

    'SP',
    'LO',
    'KL',
    'AR',
    'NO',
    'VO',
    'NV',
    'PS',
    'MU',

    'KA', //    '��������������� ������� (UA2F)',

    'MA', //    '������ (UA3A)',
    'MO', //    '���������� ������� (UA3C)',
    'OR', //    '��������� ������� (UA3E)',
    'LP', //    '�������� ������� (UA3G)',
    'TV', //    '�������� ������� (UA3I)',
    'SM', //    '���������� ������� (UA3L)',
    'YR', //    '����������� ������� (UA3M)',
    'KS', //    '����������� ������� (UA3N)',
    'TL', //    '�������� ������� (UA3P)',
    'VR', //    '����������� ������� (UA3Q)',
    'TB', //    '���������� ������� (UA3R)',
    'RA', //    '��������� ������� (UA3S)',
    'NN', //    '������������� ������� (UA3T)',
    'IV', //    '���������� ������� (UA3U)',
    'VL', //    '������������ ������� (UA3V)',
    'KU', //    '������� ������� (UA3W)',
    'KG', //    '��������� ������� (UA3X)',
    'BR', //    '�������� ������� (UA3Y)',
    'BO', //    '������������ ������� (UA3Z)',

    'VG', //    '������������� ������� (UA4A)',
    'SA', //    '����������� ������� (UA4C)',
    'UL', //    '����������� ������� (UA4L)',
    'KI', //    '��������� ������� (UA4N)',
    'SR', //    '��������� ������� (UA4H)',
    'PE', //    '���������� ������� (UA4F)',
    'UD', //    '���������� ���������� (UA4W)',
    'TA', //    '���������� ��������� (UA4P)',
    'MR', //    '���������� ����� �� (UA4S)',
    'MD', //    '���������� �������� (UA4U)',
    'CU', //    '��������� ���������� (UA4Y)',

    'KR', //    '������������� ���� (UA6A)',
    'KC', //    '���������-���������� ���������� (UA6E)',
    'ST', //    '�������������� ���� (UA6H)',
    'KM', //    '���������� �������� (UA6I)',
    'SO', //    '���������� �������� ������ - ������ (UA6J)',
    'RO', //    '���������� ������� (UA6L)',
    'CN', //    '��������� ���������� (UA6P)',
    'IN', //    '���������� ��������� (UA6Q)',
    'AO', //    '������������ ������� (UA6U)',
    'DA', //    '���������� �������� (UA6W)',
    'KB', //    '���������-���������� ���������� (UA6X)',
    'AD', //    '���������� ������ (UA6Y)',

    'CB', //    '����������� ������� (UA9A)',
    'SV', //    '������������ ������� (UA9C)',
    'PM', //    '�������� ���� (UA9F)',
//    '����-��������� ����� (UA9G)',
    'TO', //    '������� ������� (UA9H)',
    'HM', //    '�����-���������� ���������� ����� - ���� (UA9J)',
    'YN', //    '�����-�������� ���������� ����� (UA9K)',
    'TN', //    '��������� ������� (UA9L)',
    'OM', //    '������ ������� (UA9M)',
    'NS', //    '������������� ������� (UA9O)',
    'KN', //    '���������� ������� (UA9Q)',
    'OB', //    '������������ ������� (UA9S)',
    'KE', //    '����������� ������� (UA9U)',
    'BA', //    '���������� ������������ (UA9W)',
    'KO', //    '���������� ���� (UA9X)',
    'AL', //    '��������� ���� (UA9Y)',
    'GA', //    '���������� ����� (UA9Z)',

    'KK', //    '������������ ���� (UA0A)',
//    '? (UA0B)',
    'HK', //    '����������� ���� (UA0C)',
    'EA', //    '��������� ���������� ������� (UA0D)',
    'SL', //    '����������� ������� (UA0F)',
//    '? (UA0H)',
    'MG', //    '����������� ������� (UA0I)',
    'AM', //    '�������� ������� (UA0J)',
    'CK', //    '��������� ���������� ����� (UA0K)',
    'PK', //    '���������� ���� (UA0L)',
    'BU', //    '���������� ������� (UA0O)',
    'YA', //    '���������� ���� (������) (UA0Q)',
    'IR', //    '��������� ������� (UA0S)',
    'ZK', //?//    '������������� ���� (UA0U)',
    'HA', //    '���������� ������� (UA0W)',
//    '? (UA0X)',
    'TU', //    '���������� ���� (UA0Y)',
    'KT' //    '���������� ���� (UA0Z)'
    );

  RussianRegionsTypeStringArray         : array[RussianRegionType] of PChar =
    (
    'rtUnknownRegion',

    '�����-��������� (UA1A)',
    '������������� ������� (UA1C)',
    '���������� ������� (UA1N)',
    '������������� ������� (UA1O)',
    '�������� ���������� ����� (UA1P)',
    '����������� ������� (UA1Q)',
    '������������ ������� (UA1T)',
    '��������� ������� (UA1W)',
    '���������� ������� (UA1Z)',

    '��������������� ������� (UA2F)',

    '������ (UA3A)',
    '���������� ������� (UA3C)',
    '��������� ������� (UA3E)',
    '�������� ������� (UA3G)',
    '�������� ������� (UA3I)',
    '���������� ������� (UA3L)',
    '����������� ������� (UA3M)',
    '����������� ������� (UA3N)',
    '�������� ������� (UA3P)',
    '����������� ������� (UA3Q)',
    '���������� ������� (UA3R)',
    '��������� ������� (UA3S)',
    '������������� ������� (UA3T)',
    '���������� ������� (UA3U)',
    '������������ ������� (UA3V)',
    '������� ������� (UA3W)',
    '��������� ������� (UA3X)',
    '�������� ������� (UA3Y)',
    '������������ ������� (UA3Z)',

    '������������� ������� (UA4A)',
    '����������� ������� (UA4C)',
    '����������� ������� (UA4L)',
    '��������� ������� (UA4N)',
    '��������� ������� (UA4H)',
    '���������� ������� (UA4F)',
    '���������� ���������� (UA4W)',
    '���������� ��������� (UA4P)',
    '���������� ����� �� (UA4S)',
    '���������� �������� (UA4U)',
    '��������� ���������� (UA4Y)',

    '������������� ���� (UA6A)',
    '���������-���������� ���������� (UA6E)',
    '�������������� ���� (UA6H)',
    '���������� �������� (UA6I)',
    '���������� �������� ������ - ������ (UA6J)',
    '���������� ������� (UA6L)',
    '��������� ���������� (UA6P)',
    '���������� ��������� (UA6Q)',
    '������������ ������� (UA6U)',
    '���������� �������� (UA6W)',
    '���������-���������� ���������� (UA6X)',
    '���������� ������ (UA6Y)',

    '����������� ������� (UA9A)',
    '������������ ������� (UA9C)',
    '�������� ���� (UA9F)',
//    '����-��������� ����� (UA9G)',
    '������� ������� (UA9H)',
    '�����-���������� ���������� ����� - ���� (UA9J)',
    '�����-�������� ���������� ����� (UA9K)',
    '��������� ������� (UA9L)',
    '������ ������� (UA9M)',
    '������������� ������� (UA9O)',
    '���������� ������� (UA9Q)',
    '������������ ������� (UA9S)',
    '����������� ������� (UA9U)',
    '���������� ������������ (UA9W)',
    '���������� ���� (UA9X)',
    '��������� ���� (UA9Y)',
    '���������� ����� (UA9Z)',

    '������������ ���� (UA0A)',
//    '? (UA0B)',
    '����������� ���� (UA0C)',
    '��������� ���������� ������� (UA0D)',
    '����������� ������� (UA0F)',
//    '? (UA0H)',
    '����������� ������� (UA0I)',
    '�������� ������� (UA0J)',
    '��������� ���������� ����� (UA0K)',
    '���������� ���� (UA0L)',
    '���������� ������� (UA0O)',
    '���������� ���� (������) (UA0Q)',
    '��������� ������� (UA0S)',
    '������������� ���� (UA0U)',
    '���������� ������� (UA0W)',
//    '? (UA0X)',
    '���������� ���� (UA0Y)',
    '���������� ���� (UA0Z)'
    );
type
  OkrugType =
    (
    foUnKnownOkrug,
    foDalneVostochnyiy,
    foPrivolzhskiy,
    foSeveroZapadniy,
    foSibirskiy,
    foUralskiy,
    foCentralniy,
    foYuzhniy,
    foSeveroKavkazskiy
    );

const

  OkrugTypeStringArray                  : array[OkrugType] of PChar =
    (
    'UnKnownOkrug',
    '��������������� ����������� �����',
    '����������� ����������� �����',
    '������-�������� ����������� �����',
    '��������� ����������� �����',
    '��������� ����������� �����',
    '����������� ����������� �����',
    '����� ����������� �����',
    '������-���������� ����������� �����'
    );

var
  RegionsResults                        : array[RussianRegionType] of RegionResultsRecord;

//function GetRegion(Callsign: CallString): RegionType;
function GetOkrugByOblast(Oblast: RussianRegionType): OkrugType;
function GetRussiaOblastByTwoChars(c1, c2: Char): RussianRegionType;

implementation

function GetRussiaOblastByTwoChars(c1, c2: Char): RussianRegionType;
begin

  Result := rtUnknownRegion;

  case c1 of

    '1':
      begin
        case c2 of
          'A', 'B', 'F', 'G', 'J', 'L', 'M': Result := rtUA1A;
          'C', 'D': Result := rtUA1C;
          'N': Result := rtUA1N;
          'O': Result := rtUA1O;
          'P': Result := rtUA1P;
          'Q' {, 'R', 'S'}: Result := rtUA1Q;

          'T': Result := rtUA1T;
          'W': Result := rtUA1W;
          'Z': Result := rtUA1Z;

        end;
      end;
{
    '2':
      begin
        case c2 of
          'C', 'F': Result := rtUA2F;
          'D': Result := rtUA3C;
          'S': Result := rtUA3S;
          'T': Result := rtUA3T;
          'U': Result := rtUA3U;
        end;
      end;
}
    '2', '3', '5':
      begin
        case c2 of
          'A', 'B', 'C': Result := rtUA3A;
          'D', 'F', 'H': Result := rtUA3C;

          'E': Result := rtUA3E;
          'G': Result := rtUA3G;
          'I': Result := rtUA3I;
          'L': Result := rtUA3L;
          'M': Result := rtUA3M;
          'N': Result := rtUA3N;
          'P': Result := rtUA3P;
          'K', 'Q', 'O': Result := rtUA3Q;
          'R': Result := rtUA3R;
          'S': Result := rtUA3S;
          'T': Result := rtUA3T;
          'U': Result := rtUA3U;
          'V': Result := rtUA3V;
          'W': Result := rtUA3W;
          'X': Result := rtUA3X;
          'Y': Result := rtUA3Y;
          'Z': Result := rtUA3Z;
        end;
      end;

    '4':
      begin
        case c2 of
          'A', 'B': Result := rtUA4A;
          'C', 'D': Result := rtUA4C;
          'F': Result := rtUA4F;
          'H', 'I': Result := rtUA4H;
          'L', 'M': Result := rtUA4L;
          'N', 'O': Result := rtUA4N;
          'P', 'Q', 'R': Result := rtUA4P;
          'S', 'T': Result := rtUA4S;
          'U': Result := rtUA4U;
          'W': Result := rtUA4W;
          'Y', 'Z': Result := rtUA4Y;

        end;
      end;
{
    '5':
      begin
        case c2 of
          'A': Result := rtUA3A;
          'F': Result := rtUA3C;
          'K', 'Q', 'O': Result := rtUA3Q;
          'Z': Result := rtUA3Z;
        end;
      end;
}
    '7', '6':
      begin
        case c2 of
          'A', 'B', 'C', 'D': Result := rtUA6A;
          'E': Result := rtUA6E;
          'G', 'H', 'F': Result := rtUA6H;
          'I': Result := rtUA6I;
          'J': Result := rtUA6J;
          'L', 'M', 'N', 'O': Result := rtUA6L;
          'P': Result := rtUA6P;
          'Q': Result := rtUA6Q;
          'U', 'V': Result := rtUA6U;
          'W': Result := rtUA6W;
          'X': Result := rtUA6X;
          'Y': Result := rtUA6Y;
        end;
      end;

    '8', '9':
      begin
        case c2 of
          'A', 'B': Result := rtUA9A;
          'C', 'D', 'E': Result := rtUA9C;
          'F': Result := rtUA9F;
//          'G': Result := rtUA9G;
          'H', 'I': Result := rtUA9H;
          'J': Result := rtUA9J;
          'K': Result := rtUA9K;
          'L': Result := rtUA9L;
          'M', 'N': Result := rtUA9M;
          'O', 'P': Result := rtUA9O;
          'Q', 'R': Result := rtUA9Q;
          'S', 'T': Result := rtUA9S;
          'U', 'V': Result := rtUA9U;

          'W': Result := rtUA9W;
          'X': Result := rtUA9X;
          'Y': Result := rtUA9Y;

          'Z': Result := rtUA9Z;
        end;
      end;

    '0':
      begin
        case c2 of
          'A', 'B', 'H': Result := rtUA0A;
//          'B': Result := rtUA0B;
          'C': Result := rtUA0C;
          'D': Result := rtUA0D;
          'F', 'E': Result := rtUA0F;
//          'H': Result := rtUA0H;
          'I': Result := rtUA0I;
          'J': Result := rtUA0J;
          'K': Result := rtUA0K;
          'L', 'M', 'N': Result := rtUA0L;
          'O': Result := rtUA0O;
          'Q': Result := rtUA0Q;
          'R', 'S', 'T': Result := rtUA0S;

          'U', 'V': Result := rtUA0U;
          'W': Result := rtUA0W;
//          'X': Result := rtUA0X;
          'Y': Result := rtUA0Y;
          'Z', 'X': Result := rtUA0Z;
        end;
      end;
  end;

  if c1 = '2' then
    if c2 in ['F', 'K', 'C'] then
      Result := rtUA2F;

end;
{
function GetRegion(Callsign: CallString): RegionType;
var
  TwoChars                              : Str2;
begin
  Result := rtUnknownRegion;
  TwoChars := GetOblast(Callsign);
  if length(TwoChars) <> 2 then Exit;
  Result := GetRussiaOblastByTwoChars(TwoChars[1], TwoChars[2]);
end;
}
{
procedure MakeRegionsList;
var
  c1, c2                                : Char;
  TempCallsign                          : CallString;
  ResultRegion, TempRegion              : RegionType;
  h                                     : HWND;
  TempBuffer                            : array[0..255] of Char;
begin

  h := CreateFile('regions.txt', GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_ARCHIVE, 0);

  for TempRegion := Low(RegionType) to High(RegionType) do
  begin

    if TempRegion = rtUnknownRegion then Continue;

    Format(TempBuffer, '%3u %-50s: ', integer(TempRegion), RegionTypeStringArray[TempRegion]);
    sWriteFile(h, TempBuffer);
    for c1 := '0' to '9' do
      for c2 := 'A' to 'Z' do
      begin
        Windows.ZeroMemory(@TempCallsign, SizeOf(TempCallsign));
        TempCallsign[0] := CHR(4);
        TempCallsign[1] := 'U';
        TempCallsign[2] := 'A';
        TempCallsign[3] := c1;
        TempCallsign[4] := c2;

        ResultRegion := GetRegion(TempCallsign);

        if ResultRegion = TempRegion then
        begin
          Format(TempBuffer, ' %s', @TempCallsign[1]);
          sWriteFile(h, TempBuffer);
        end;
      end;

    sWriteFile(h, #13#10);
  end;

  CloseHandle(h);

end;
}

function GetOkrugByOblast(Oblast: RussianRegionType): OkrugType;
begin

  Result := foUnKnownOkrug;

  case Oblast of
    rtUA3Z,
      rtUA3Y,
      rtUA3V,
      rtUA3Q,
      rtUA3U,
      rtUA3X,
      rtUA3N,
      rtUA3W,
      rtUA3G,
      rtUA3C,
      rtUA3E,
      rtUA3S,
      rtUA3L,
      rtUA3R,
      rtUA3I,
      rtUA3P,
      rtUA3M,
      rtUA3A: Result := foCentralniy;

    rtUA6Y,
      rtUA6I,
      rtUA6A,
      rtUA6U,
      rtUA4A,
      rtUA6L: Result := foYuzhniy;

    rtUA1N,
      rtUA9X,
      rtUA1O,
      rtUA1Q,
      rtUA2F,
      rtUA1C,
      rtUA1Z,
      rtUA1T,
      rtUA1W,
      rtUA1A,
      rtUA1P: Result := foSeveroZapadniy;

    rtUA0Q,
      rtUA0Z,
      rtUA0L,
      rtUA0C,
      rtUA0J,
      rtUA0I,
      rtUA0F,
      rtUA0D,
      rtUA0K: Result := foDalneVostochnyiy;

    rtUA9Z,
      rtUA0O,
      rtUA0Y,
      rtUA0W,
      rtUA9Y,
      rtUA0U,
      rtUA0A,
      rtUA0S,
      rtUA9U,
      rtUA9O,
      rtUA9M,
      rtUA9H: Result := foSibirskiy;

    rtUA9Q,
      rtUA9C,
      rtUA9L,
      rtUA9A,
      rtUA9J,
      rtUA9K: Result := foUralskiy;

    rtUA9W,
      rtUA4S,
      rtUA4U,
      rtUA4P,
      rtUA4W,
      rtUA4Y,
      rtUA9F,
      rtUA4N,
      rtUA3T,
      rtUA9S,
      rtUA4F,
      rtUA4H,
      rtUA4C,
      rtUA4L: Result := foPrivolzhskiy;

    rtUA6W,
      rtUA6Q,
      rtUA6X,
      rtUA6E,
      rtUA6J,
      rtUA6P,
      rtUA6H: Result := foSeveroKavkazskiy;
  end;

end;

begin
//  MakeRegionsList;
end.

