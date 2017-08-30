
@isTest
private class IbanTest {

    static testmethod void test_validate_positive() {
        System.assertEquals(true, Iban.validate('NL 59ABNA 0450 0933 69'));
        System.assertEquals(true, Iban.validate('AL47 2121 1009 0000 0002 3569 8741'));
        System.assertEquals(true, Iban.validate('AZ21 NABZ 0000 0000 1370 1000 1944'));
        System.assertEquals(true, Iban.validate('LV80 BANK 0000 4351 9500 1'));
        System.assertEquals(true, Iban.validate('MT84 MALT 0110 0001 2345 MTLC AST0 01S'));
        System.assertEquals(true, Iban.validate('TN59 1000 6035 1835 9847 8831'));
        System.assertEquals(true, Iban.validate('GB29 RBOS 6016 1331 9268 19'));
    }

    static testmethod void test_validate_negative() {
        System.assertEquals(false, Iban.validate('BR Hyrulian Rupees'));
        System.assertEquals(false, Iban.validate('GB Gringotts'));
    }

}