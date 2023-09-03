class ValidatorHelper {
  static String? requiredValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obbligatorio";
    }

    return null;
  }

  static String? integerValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obbligatorio";
    }

    if (int.tryParse(value) == null) {
      return "Inserisci un numero intero";
    }

    return null;
  }
}