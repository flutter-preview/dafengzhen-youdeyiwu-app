// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserIdStateCWProxy {
  UserIdState details(UserDetailsClientVo? details);

  UserIdState isLoading(bool? isLoading);

  UserIdState currentSection(SectionVo? currentSection);

  UserIdState currentTag(TagVo? currentTag);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserIdState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserIdState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserIdState call({
    UserDetailsClientVo? details,
    bool? isLoading,
    SectionVo? currentSection,
    TagVo? currentTag,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserIdState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserIdState.copyWith.fieldName(...)`
class _$UserIdStateCWProxyImpl implements _$UserIdStateCWProxy {
  const _$UserIdStateCWProxyImpl(this._value);

  final UserIdState _value;

  @override
  UserIdState details(UserDetailsClientVo? details) => this(details: details);

  @override
  UserIdState isLoading(bool? isLoading) => this(isLoading: isLoading);

  @override
  UserIdState currentSection(SectionVo? currentSection) =>
      this(currentSection: currentSection);

  @override
  UserIdState currentTag(TagVo? currentTag) => this(currentTag: currentTag);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserIdState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserIdState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserIdState call({
    Object? details = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? currentSection = const $CopyWithPlaceholder(),
    Object? currentTag = const $CopyWithPlaceholder(),
  }) {
    return UserIdState(
      details: details == const $CopyWithPlaceholder()
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as UserDetailsClientVo?,
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool?,
      currentSection: currentSection == const $CopyWithPlaceholder()
          ? _value.currentSection
          // ignore: cast_nullable_to_non_nullable
          : currentSection as SectionVo?,
      currentTag: currentTag == const $CopyWithPlaceholder()
          ? _value.currentTag
          // ignore: cast_nullable_to_non_nullable
          : currentTag as TagVo?,
    );
  }
}

extension $UserIdStateCopyWith on UserIdState {
  /// Returns a callable class that can be used as follows: `instanceOfUserIdState.copyWith(...)` or like so:`instanceOfUserIdState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserIdStateCWProxy get copyWith => _$UserIdStateCWProxyImpl(this);
}
