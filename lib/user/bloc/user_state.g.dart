// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStateCWProxy {
  UserState details(UserDetailsClientVo? details);

  UserState isLoading(bool? isLoading);

  UserState currentSection(SectionVo? currentSection);

  UserState currentTag(TagVo? currentTag);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserState call({
    UserDetailsClientVo? details,
    bool? isLoading,
    SectionVo? currentSection,
    TagVo? currentTag,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserState.copyWith.fieldName(...)`
class _$UserStateCWProxyImpl implements _$UserStateCWProxy {
  const _$UserStateCWProxyImpl(this._value);

  final UserState _value;

  @override
  UserState details(UserDetailsClientVo? details) => this(details: details);

  @override
  UserState isLoading(bool? isLoading) => this(isLoading: isLoading);

  @override
  UserState currentSection(SectionVo? currentSection) =>
      this(currentSection: currentSection);

  @override
  UserState currentTag(TagVo? currentTag) => this(currentTag: currentTag);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserState call({
    Object? details = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? currentSection = const $CopyWithPlaceholder(),
    Object? currentTag = const $CopyWithPlaceholder(),
  }) {
    return UserState(
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

extension $UserStateCopyWith on UserState {
  /// Returns a callable class that can be used as follows: `instanceOfUserState.copyWith(...)` or like so:`instanceOfUserState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStateCWProxy get copyWith => _$UserStateCWProxyImpl(this);
}
