import 'package:formz/formz.dart';

enum SearchTextValidationError { empty }

class SearchText extends FormzInput<String, SearchTextValidationError> {
  const SearchText.pure() : super.pure('');

  const SearchText.dirty([String value = '']) : super.dirty(value);

  @override
  SearchTextValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : SearchTextValidationError.empty;
  }
}
