import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  requiredFiled() => add((value) {
        if (value?.trim().isEmpty ?? false) {
          return 'Field is required';
        }
        return null;
      });
}
