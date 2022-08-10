public class Utils {
    private static String formatador(String param) {
        param = param.replace('.', ''); // remover pontos
        param = param.replace('-', ''); // remove traço
        param = param.replace('/', ''); // remove barras
        param = param.replace(' ', ''); // remove espaço

        return param;
    }

    public static Boolean ValidaCPF(String cpf) {
        String stringFormatada = formatador(cpf);
        if (stringFormatada.length() == 11) {
            if (stringFormatada.isNumeric()) {
                return true;
            }
        }

        return false;
    }

    public static Boolean ValidaCNPJ(String cnpj) {
        String stringFormatada = formatador(cnpj);

        if (stringFormatada.length() == 14) {
            if (stringFormatada.isNumeric()) {
                return true;
            }
        }

        return false;
    }
}