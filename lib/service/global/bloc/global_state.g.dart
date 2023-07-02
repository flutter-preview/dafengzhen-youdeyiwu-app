// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GlobalStateCWProxy {
  GlobalState path(PathVo? path);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GlobalState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GlobalState(...).copyWith(id: 12, name: "My name")
  /// ````
  GlobalState call({
    PathVo? path,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGlobalState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGlobalState.copyWith.fieldName(...)`
class _$GlobalStateCWProxyImpl implements _$GlobalStateCWProxy {
  const _$GlobalStateCWProxyImpl(this._value);

  final GlobalState _value;

  @override
  GlobalState path(PathVo? path) => this(path: path);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GlobalState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GlobalState(...).copyWith(id: 12, name: "My name")
  /// ````
  GlobalState call({
    Object? path = const $CopyWithPlaceholder(),
  }) {
    return GlobalState(
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as PathVo?,
    );
  }
}

extension $GlobalStateCopyWith on GlobalState {
  /// Returns a callable class that can be used as follows: `instanceOfGlobalState.copyWith(...)` or like so:`instanceOfGlobalState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GlobalStateCWProxy get copyWith => _$GlobalStateCWProxyImpl(this);
}
