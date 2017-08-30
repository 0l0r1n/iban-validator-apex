public class IbanFormatRepository {
    
    public static List<Iban_Format__mdt> getByNationalBankCodes(Set<String> nationalBankCodes) {
        return [SELECT DeveloperName, National_Bank_Code__c, Characters__c FROM Iban_Format__mdt WHERE
                National_Bank_Code__c IN: nationalBankCodes];
    }
    
}
