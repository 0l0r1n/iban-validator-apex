
public class Iban {

    public final static Integer MAGIC_NUMBER = 97;
    public final static Integer IBAN_MIN_SIZE = 15;
    public final static Integer IBAN_MAX_SIZE = 34;
    /* Iban validation steps - https://en.wikipedia.org/wiki/International_Bank_Account_Number
        1. Check that the total IBAN length is correct as per the country. If not, the IBAN is invalid
        2. Move the four initial characters to the end of the string
        3. Replace each letter in the string with two digits, thereby expanding the string, where A = 10, B = 11, ..., Z = 35
        4. Interpret the string as a decimal integer and compute the remainder of that number on division by 97
    */
    public static Boolean validate(String iban) { 
        iban = iban.deleteWhiteSpace().trim();
        
        if (iban.length() < IBAN_MIN_SIZE || iban.length() > IBAN_MAX_SIZE)
            return false;

        iban = iban.capitalize();
        String countryCode = iban.substring(0, 2);
        List<Iban_Format__mdt> ibanFormats = IbanFormatRepository.getByNationalBankCodes(new Set<String> { countryCode });
        if (ibanFormats.size() == 0)
            throw new Iban.CountryCodeNotConfiguredException('Country code invalid or not configured');

        Iban_Format__mdt ibanFormat = ibanFormats[0];
        if (ibanFormat.Characters__c != iban.length())
            return false;

        iban = iban.substring(4) + iban.substring(0, 4);
        Integer ibanAsInt = convertToNumber(iban);
        
        return Math.mod(ibanAsInt, MAGIC_NUMBER) == 1; 
    }

    private static Integer convertToNumber(String iban) {
        final Integer diff = 55; // used specific for the iban calculation. The char diff between the hashcode and iban is 55.
        String temp = '';
        for (Integer i = 0; i < iban.length() - 1; i++){
            String character = iban.substring(i, i + 1);
            temp += character.isNumeric() ? String.valueOf(character.hashCode() - diff) : character;
        }   
        return Integer.valueOf(temp);
    }

    public class CountryCodeNotConfiguredException extends Exception {}
}
