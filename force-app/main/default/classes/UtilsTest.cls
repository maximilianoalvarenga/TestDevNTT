@isTest
private class UtilsTest {
	@isTest
    static void cpfValidoComMascara() {
        Boolean retorno = Utils.ValidaCPF('567.813.435-30');
        System.assertEquals(true, retorno);
    }
    
    @isTest
    static void cpfValidoSemMascara() {
        Boolean retorno = Utils.ValidaCPF('56781343530');
        System.assertEquals(true, retorno);
    }
    
    @isTest
    static void cpfInvalidoComMascara() {
        Boolean retorno = Utils.ValidaCPF('567.813.435-3a');
        System.assertEquals(false, retorno);
    }
    
    @isTest
    static void cpfInvalidoSemMascara() {
        Boolean retorno = Utils.ValidaCPF('5678134353a');
        System.assertEquals(false, retorno);
    }
    
    @isTest
    static void cnpjValidoComMascara() {
        Boolean retorno = Utils.ValidaCNPJ('68.223.866/0001-03');
        System.assertEquals(true, retorno);
    }
    
    @isTest
    static void cnpjValidoSemMascara() {
        Boolean retorno = Utils.ValidaCNPJ('68223866000103');
        System.assertEquals(true, retorno);
    }
    
    @isTest
    static void cnpjInvalidoComMascara() {
        Boolean retorno = Utils.ValidaCNPJ('68.223.866/0001-0a');
        System.assertEquals(false, retorno);
    }
    
    @isTest
    static void cnpjInvalidoSemMascara() {
        Boolean retorno = Utils.ValidaCNPJ('6822386600010a');
        System.assertEquals(false, retorno);
    }
}