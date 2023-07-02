// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessageStateCWProxy {
  MessageState details(UserDetailsClientVo? details);

  MessageState isLoading(bool? isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageState call({
    UserDetailsClientVo? details,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessageState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMessageState.copyWith.fieldName(...)`
class _$MessageStateCWProxyImpl implements _$MessageStateCWProxy {
  const _$MessageStateCWProxyImpl(this._value);

  final MessageState _value;

  @override
  MessageState details(UserDetailsClientVo? details) => this(details: details);

  @override
  MessageState isLoading(bool? isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessageState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessageState(...).copyWith(id: 12, name: "My name")
  /// ````
  MessageState call({
    Object? details = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return MessageState(
      details: details == const $CopyWithPlaceholder()
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as UserDetailsClientVo?,
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool?,
    );
  }
}

extension $MessageStateCopyWith on MessageState {
  /// Returns a callable class that can be used as follows: `instanceOfMessageState.copyWith(...)` or like so:`instanceOfMessageState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MessageStateCWProxy get copyWith => _$MessageStateCWProxyImpl(this);
}
