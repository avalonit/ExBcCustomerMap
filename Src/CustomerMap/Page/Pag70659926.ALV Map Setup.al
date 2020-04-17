page 70659926 "ALV Map Setup"
{
    PageType = Card;
    SourceTable = "ALV Map Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = Basic;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Web Viewer URL"; "Web Viewer URL")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        GetRecord();
    end;
}