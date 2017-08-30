
@isTest
private class IbanTest {

    static testmethod void test_validate_positive() {
        System.assertEquals(true, Iban.validate('NL 59ABNA 0450 0933 69'));
        System.assertEquals(true, Iban.validate('AL47 2121 1009 0000 0002 3569 8741'));
        System.assertEquals(true, Iban.validate('AZ21 NABZ 0000 0000 1370 1000 1944'));
        System.assertEquals(true, Iban.validate('LV80 BANK 0000 4351 9500 1'));
        System.assertEquals(true, Iban.validate('MT84 MALT 0110 0001 2345 MTLC AST0 01S'));
        System.assertEquals(true, Iban.validate('TN59 1000 6035 1835 9847 8831'));
    }

    static testmethod void test_validate_negative() {
        System.assertEquals(false, Iban.validate('NL 59ABNA 0450 0933 70'));
        System.assertEquals(false, Iban.validate('AL47 2121 1009 0000 0002 3569 8742'));
        System.assertEquals(false, Iban.validate('AZ21 NABZ 0000 0000 1370 1000 1945'));
        System.assertEquals(false, Iban.validate('LV80 BANK 0000 4351 9500 2'));
        System.assertEquals(false, Iban.validate('MT84 MALT 0110 0001 2345 MTLC AST0 01T'));
        System.assertEquals(false, Iban.validate('TN59 1000 6035 1835 9847 8832'));
    }

}