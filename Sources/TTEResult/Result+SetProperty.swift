import Foundation

extension Result {

  /// Sets  a property on one results success with another results success
  /// - Parameters:
  ///   - kp: Keypath to set on the result
  ///   - v: The result from which to get the value
  /// - Returns: A new void result. Effectively this consumes both results
  @discardableResult
  func setProperty<Value>(
    _ kp: ReferenceWritableKeyPath<Success, Value?>, _ v: Result<Value, Failure>
  ) -> Result<Void, Failure> {
    zip(self, v)
      .flatMap { (root, value) in
        root[keyPath: kp] = value
        return .success(())
      }
  }

  /// Sets  a property on one results success with another results success
  /// - Parameters:
  ///   - kp: Keypath to set on the result
  ///   - v: The result from which to get the value
  /// - Returns: A new void result. Effectively this consumes both results
  @discardableResult
  func setProperty<Value>(
    _ kp: ReferenceWritableKeyPath<Success, Value>, _ v: Result<Value, Failure>
  ) -> Result<Void, Failure> {
    zip(self, v).flatMap { (root, value) in
      root[keyPath: kp] = value
      return .success(())
    }
  }
}
