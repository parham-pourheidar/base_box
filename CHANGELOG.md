# Changelog

All notable changes to this package will be documented in this file.

## [1.0.0] - 2025-08-19

### Added
- Initial release of the package.
- `BaseBox` widget:
    - Customizable padding, margin, height, width.
    - Support for border, border radius, and individual side borders.
    - Gradient and box shadow support.
    - Tap and hover interactions with optional splash/hover colors.
    - Tooltip support.
    - Circle mode and child alignment options.
- `DisposableLazyIndexedStack` widget:
    - Lazily builds children when needed.
    - Disposes previous child when index changes.
    - Ideal for tabs or screens where only one child is visible at a time.
