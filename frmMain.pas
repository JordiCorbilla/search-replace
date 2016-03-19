// Copyright (c) 2016, Jordi Corbilla
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation
// and/or other materials provided with the distribution.
// - Neither the name of this library nor the names of its contributors may be
// used to endorse or promote products derived from this software without
// specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.CategoryButtons, System.Actions,
  Vcl.ActnList, Vcl.WinXCtrls, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    btnSearch: TButton;
    edtExtension: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtLocation: TEdit;
    btnLocation: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Content: TTabSheet;
    ListFiles: TListView;
    btnReplace: TButton;
    edtOldText: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtNewText: TEdit;
    StatusBar1: TStatusBar;
    pnlToolbar: TPanel;
    mainMenu: TImage;
    SV: TSplitView;
    ActionList1: TActionList;
    actSearchReplace: TAction;
    actSearchEmpty: TAction;
    actSettings: TAction;
    catMenuItems: TCategoryButtons;
    imgMenu: TImageList;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    procedure btnLocationClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
  private
    procedure SearchAllFilesUnderDirectory(const Folder: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  flickr.lib.folder;

{$R *.dfm}

procedure TForm1.SearchAllFilesUnderDirectory(const Folder: string);
var
  searchRecord: TSearchRec;
  item : TListItem;
begin
  if FindFirst(IncludeTrailingBackslash(Folder) + edtExtension.text, faAnyFile or faDirectory, searchRecord) = 0 then
    try
      repeat
        if (searchRecord.Attr and faDirectory) = 0 then
        begin
          item := ListFiles.Items.Add;
          item.Caption := (IncludeTrailingBackslash(Folder) + searchRecord.Name)
        end
        else if (searchRecord.Name <> '.') and (searchRecord.Name <> '..') then
          SearchAllFilesUnderDirectory(IncludeTrailingBackslash(Folder) + searchRecord.Name);
      until FindNext(searchRecord) <> 0;
    finally
      FindClose(searchRecord);
    end;
end;

procedure TForm1.btnReplaceClick(Sender: TObject);
var
  fileList : TStringlist;
  i: Integer;
begin
  for i := 0 to ListFiles.Items.Count-1 do
  begin
    fileList := TStringlist.Create;
    try
      try
        fileList.LoadFromFile(ListFiles.Items[i].Caption);
        fileList.Text := StringReplace(fileList.Text,edtOldText.text,edtNewText.text,[rfReplaceAll, rfIgnoreCase]);
        fileList.SaveToFile(ListFiles.Items[i].Caption);
        ListFiles.Items[i].SubItems.Add('Completed');
      finally
        fileList.Free;
      end;
    except on e: exception do
      ListFiles.Items[i].SubItems.Add(e.Message);
    end;
  end;
end;

procedure TForm1.btnSearchClick(Sender: TObject);
begin
  SearchAllFilesUnderDirectory(edtLocation.text);
end;

procedure TForm1.btnLocationClick(Sender: TObject);
begin
   edtLocation.text := TFolder.BrowseForFolder;
end;

end.
