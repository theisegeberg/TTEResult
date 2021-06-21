import Foundation

/// Combines two results into one.
/// - Parameters:
///   - a: Result A
///   - b: Result B
/// - Returns: A result of (A,B)
public func zip<A, B, Failure>(_ a: Result<A, Failure>, _ b: Result<B, Failure>) -> Result<(A, B), Failure>
{
  a.flatMap { a in
    b.flatMap { b in
      .success((a, b))
    }
  }
}

/// Zips A? and B? together into a tuple of (A,B)?
/// - Parameters:
///   - a: Optional A
///   - b: Optional B
/// - Returns: Tuple of A and B
public func zip<A, B>(_ a: A?, _ b: B?) -> (A, B)? {
  return a.flatMap { a in b.map { b in (a, b) } }
}
