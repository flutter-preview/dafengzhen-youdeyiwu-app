// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_id_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostIdStateCWProxy {
  PostIdState details(PostDetailsClientVo? details);

  PostIdState isLoading(bool? isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostIdState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostIdState(...).copyWith(id: 12, name: "My name")
  /// ````
  PostIdState call({
    PostDetailsClientVo? details,
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostIdState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostIdState.copyWith.fieldName(...)`
class _$PostIdStateCWProxyImpl implements _$PostIdStateCWProxy {
  const _$PostIdStateCWProxyImpl(this._value);

  final PostIdState _value;

  @override
  PostIdState details(PostDetailsClientVo? details) => this(details: details);

  @override
  PostIdState isLoading(bool? isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostIdState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostIdState(...).copyWith(id: 12, name: "My name")
  /// ````
  PostIdState call({
    Object? details = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return PostIdState(
      details: details == const $CopyWithPlaceholder()
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as PostDetailsClientVo?,
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool?,
    );
  }
}

extension $PostIdStateCopyWith on PostIdState {
  /// Returns a callable class that can be used as follows: `instanceOfPostIdState.copyWith(...)` or like so:`instanceOfPostIdState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostIdStateCWProxy get copyWith => _$PostIdStateCWProxyImpl(this);
}
