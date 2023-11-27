import 'package:email_validator/email_validator.dart';
import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  requiredField() => add((value) {
        if (value?.trim().isEmpty ?? false) {
          return 'The field is required';
        }
        return null;
      });

  emailField() => add((value) {
        if (value?.trim().isEmpty ?? false) {
          return 'The field is required';
        }
        if (!EmailValidator.validate(value ?? "")) {
          return "Invalid Email";
        }
        return null;
      });

  amountField(double requiredAmount) => add((value) {
        final amount = double.tryParse(value.toString()) ?? 0;
        if (amount < 0 || amount > requiredAmount) {
          return "Invalid Amount";
        }
        return null;
      });
}
