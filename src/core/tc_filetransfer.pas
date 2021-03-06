{ TorChat - TFileTransfer, represents an active file transfer

  Copyright (C) 2012 Bernd Kreuss <prof7bit@gmail.com>

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 3 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  MA 02111-1307, USA.
}

unit tc_filetransfer;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  tc_interface;

type

  { TFileTransfer represents a file transfer. It can be either a sender
    or a receiver, this depends on what methods have been used after
    construction. The GUI will define a descendant that will implement
    the abstract event methods }
  TFileTransfer = class(TInterfacedObject, IFileTransfer)
  strict private
    FID: String;
    FGuiHandle: Pointer;
    FClient: IClient;
    FBuddy: IBuddy;
    FFileName: String;
    FIsSender: Boolean;
  public
    constructor Create(ABuddy: IBuddy; AFileName: String);
    destructor Destroy; override;
    function ID: String;
    procedure SetGuiHandle(AHandle: Pointer);
    function GuiHandle: Pointer;
    procedure StartSending;
    procedure CheckState;
    procedure OnProgress; virtual; abstract;
    procedure OnCancel; virtual; abstract;
    procedure OnComplete; virtual; abstract;
    procedure ReceivedFileChunk(StartByte: PtrUInt; FileChunk: String);
    procedure ReceivedBrokenChunk(StartByte: PtrUInt);
  end;

implementation
uses
  tc_prot_filename,
  tc_prot_filedata,
  tc_prot_filedata_ok,
  tc_prot_filedata_error,
  tc_prot_file_stop_sending,
  tc_prot_file_stop_receiving;


{ TFileTransfer }

constructor TFileTransfer.Create(ABuddy: IBuddy; AFileName: String);
begin
  inherited Create;
  FIsSender := False;
  FBuddy := ABuddy;
  FClient := ABuddy.Client;
end;

destructor TFileTransfer.Destroy;
begin
  inherited Destroy;
end;

function TFileTransfer.ID: String;
begin
  Result := FID;
end;

procedure TFileTransfer.SetGuiHandle(AHandle: Pointer);
begin
  FGuiHandle := AHandle;
end;

function TFileTransfer.GuiHandle: Pointer;
begin
  Result := FGuiHandle;
end;

procedure TFileTransfer.StartSending;
begin
  FIsSender := True;
end;

procedure TFileTransfer.CheckState;
begin

end;

procedure TFileTransfer.ReceivedFileChunk(StartByte: PtrUInt; FileChunk: String);
begin

end;

procedure TFileTransfer.ReceivedBrokenChunk(StartByte: PtrUInt);
begin

end;

end.

