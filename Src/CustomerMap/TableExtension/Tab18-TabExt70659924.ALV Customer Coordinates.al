tableextension 70659924 "ALV Customer Coordinates" extends Customer
{
    fields
    {
        field(70659924; "ALV Latitude"; Decimal)
        {
            Caption = 'Customer Latitude';
            DataClassification = CustomerContent;
            DecimalPlaces = 7;
        }
        field(70659925; "ALV Longitude"; Decimal)
        {
            Caption = 'Customer Longitude';
            DataClassification = CustomerContent;
            DecimalPlaces = 7;
        }

    }
}