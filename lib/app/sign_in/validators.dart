
abstract class StringValidator {
  bool isValid(String value);
}

/// Not empty validator

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

/// Password and email validator

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final invalidEmailErrorText = 'Email can\'t be empty';
  final invalidPasswordErrorText = 'Please enter your password';
}