import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  requiredField() => add((value) {
        if (value?.trim().isEmpty ?? false) {
          return 'The field is required';
        }
        return null;
      });
}
