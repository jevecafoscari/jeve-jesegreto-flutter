class ValidatorHelper {
  static String? requiredValidator(final String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obbligatorio";
    }

    return null;
  }
}