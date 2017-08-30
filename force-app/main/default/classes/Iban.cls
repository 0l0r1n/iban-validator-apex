
public class Iban {

    /* Iban validation steps - https://en.wikipedia.org/wiki/International_Bank_Account_Number
        1. Check that the total IBAN length is correct as per the country. If not, the IBAN is invalid
        2. Move the four initial characters to the end of the string
        3. Replace each letter in the string with two digits, thereby expanding the string, where A = 10, B = 11, ..., Z = 35
        4. Interpret the string as a decimal integer and compute the remainder of that number on division by 97
    */
    public static Boolean validate(final String iban) { 
        String countryCode = iban.substring(0, 2);
        Iban_Format__mdt ibanFormat = IbanFormatRepository.getByNationalBankCodes(new Set<String> { countryCode })[0];
        if (ibanFormat == null)
            throw new Iban.InvalidIbanException('Country code invalid or not configured');
        
        return false; 
    }

    public class InvalidIbanException extends Exception {}

}
