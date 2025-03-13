/// An [InputField] represents the value of a single form input field.
/// It contains information about the [value] as well as validity.

abstract class InputField<T, E> {
  const InputField._({required this.value, this.isPure = true});

  /// Constructor which create a `pure` [InputField] with a given value.
  const InputField.pure(T value) : this._(value: value);

  /// Constructor which create a `dirty` [InputField] with a given value.
  const InputField.dirty(T value) : this._(value: value, isPure: false);

  /// The value of the given [InputField].
  final T value;

  /// If the [InputField] is pure (has been touched/modified). Typically when the `InputField` is initially created,
  /// it is created using the `InputField.pure` constructor to signify that the user has not modified it.
  final bool isPure;

  /// Whether the [InputField] value is valid according to the overridden `validator`.
  bool get isValid => validator(value) == null;

  /// Whether the [InputField] value is not valid.
  bool get isNotValid => !isValid;

  /// Returns a validation error if the [InputField] is invalid.
  /// Returns `null` if the [InputField] is valid.
  E? get error => validator(value);

  /// The error to display if the [InputField] value is not valid and has been modified.
  E? get displayError => isPure ? null : error;

  /// A function that must return a validation error if the provided [value] is invalid and `null` otherwise.
  E? validator(T value);

  @override
  int get hashCode => Object.hashAll([value, isPure]);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is InputField<T, E> &&
        other.value == value &&
        other.isPure == isPure;
  }

  @override
  String toString() {
    return isPure
        ? '''InputField<$T, $E>.pure(value: $value, isValid: $isValid, error: $error)'''
        : '''InputField<$T, $E>.dirty(value: $value, isValid: $isValid, error: $error)''';
  }
}

/// Mixin for [InputField] that caches the [error] result of the [validator].
mixin InputFieldErrorCacheMixin<T, E> on InputField<T, E> {
  late final E? _error = validator(value);

  @override
  E? get error => _error;

  @override
  bool get isValid => _error == null;
}

/// Class which contains methods that help manipulate and manage validity of [InputField] instances.
class InputForm {
  /// Returns a [bool] given a list of [InputField] indicating whether the inputs are all valid.
  static bool validate(List<InputField<dynamic, dynamic>> inputs) {
    return inputs.every((input) => input.isValid);
  }

  /// Returns a [bool] given a list of [InputField] indicating whether all the inputs are pure.
  static bool isPure(List<InputField<dynamic, dynamic>> inputs) {
    return inputs.every((input) => input.isPure);
  }
}

/// Mixin that automatically handles validation of all [InputField]s present in the [inputs].
mixin InputFormMixin {
  /// Whether the [InputField] values are all valid.
  bool get isValid => InputForm.validate(inputs);

  /// Whether the [InputField] values are not all valid.
  bool get isNotValid => !isValid;

  /// Whether all of the [InputField] are pure.
  bool get isPure => InputForm.isPure(inputs);

  /// Whether at least one of the [InputField]s is dirty.
  bool get isDirty => !isPure;
  List<InputField<dynamic, dynamic>> get inputs;
}