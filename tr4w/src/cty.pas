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
If not, ref http://www.gnu.org/licenses/gpl-3.0.txt
 }
unit cty;
{$IMPORTEDDATA OFF}
interface

uses
  VC,
  Windows;
const
  ctydll                                = 'cty.dll';

function ctyFindCallsign(const s: PChar; var Index: integer): boolean;
function ctyGetContinent(Call: CallString): ContinentType;
function ctyGetCountry(Call: CallString): Word;
function ctyGetCountryID(Call: CallString): DXMultiplierString;
function ctyGetCountryNamePchar(Index: Word): PChar;
function ctyGetCountryUTCOffset(Country: Word): Smallint;
function ctyGetCQZone(Call: CallString): Byte;
function ctyGetGrid(Call: CallString; var ID: DXMultiplierString): GridString;
function ctyGetITUZone(Call: CallString): Byte;
function ctyGetZone(Call: CallString): Byte;
function ctyLoadInCountryFile(ctyFilename: PChar; CheckDupe: boolean; LoadRemainingMults: boolean): boolean;
procedure ctyLoadInR150SList;
function ctyLocateCall(Call: CallString; var QTH: QTHRecord): boolean;

function ctyGetDefaultITUZone(Country: Word): Byte;
function ctyGetDefaultCQZone(Country: Word): Byte;
function ctyGetDefaultGrid(Country: Word): GridString;
function ctyGetCountryIdByIndex(Country: Word): DXMultiplierString;
function GetPrefix(Call: CallString): PrefixString;
function ctyGetTotalCountries: integer;
function ctyGetVersion: PChar;
function GoodCallSyntax(Call: CallString): boolean;
function ctyGetContinentByIndex(Country: Word): ContinentType;
function ctyGetCountryIdPchar(Index: Word): PChar;
procedure ctySetCountryMode(CountryMode: CountryModeType);

function ctyIsActiveMultiplier(Index: Word): boolean;

implementation

function ctyFindCallsign; external ctydll Name 'ctyFindCallsign';
function ctyGetContinent; external ctydll Name 'ctyGetContinent';
function ctyGetCountry; external ctydll Name 'ctyGetCountry';
function ctyGetCountryID; external ctydll Name 'ctyGetCountryID';
function ctyGetCountryNamePchar; external ctydll Name 'ctyGetCountryNamePchar';
function ctyGetCountryUTCOffset; external ctydll Name 'ctyGetCountryUTCOffset';
function ctyGetCQZone; external ctydll Name 'ctyGetCQZone';
function ctyGetGrid; external ctydll Name 'ctyGetGrid';
function ctyGetITUZone; external ctydll Name 'ctyGetITUZone';
function ctyGetZone; external ctydll Name 'ctyGetZone';
function ctyLoadInCountryFile; external ctydll Name 'ctyLoadInCountryFile';
procedure ctyLoadInR150SList; external ctydll Name 'ctyLoadInR150SList';
function ctyLocateCall; external ctydll Name 'ctyLocateCall';

function ctyGetDefaultITUZone; external ctydll Name 'ctyGetDefaultITUZone';
function ctyGetDefaultCQZone; external ctydll Name 'ctyGetDefaultCQZone';
function ctyGetDefaultGrid; external ctydll Name 'ctyGetDefaultGrid';
function ctyGetCountryIdByIndex; external ctydll Name 'ctyGetCountryIdByIndex';
function GetPrefix; external ctydll Name 'GetPrefix';
function ctyGetTotalCountries; external ctydll Name 'ctyGetTotalCountries';
function ctyGetVersion; external ctydll Name 'ctyGetVersion';
function GoodCallSyntax; external ctydll Name 'GoodCallSyntax';
function ctyGetContinentByIndex; external ctydll Name 'ctyGetContinentByIndex';
function ctyGetCountryIdPchar; external ctydll Name 'ctyGetCountryIdPchar';

procedure ctySetCountryMode; external ctydll Name 'ctySetCountryMode';

function ctyIsActiveMultiplier; external ctydll Name 'ctyIsActiveMultiplier';

end.

