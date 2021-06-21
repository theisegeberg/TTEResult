import Foundation

/// Combines two results into one.
/// - Parameters:
///   - a: Result A
///   - b: Result B
/// - Returns: A result of (A,B)
func zip<A, B, Failure>(_ a: Result<A, Failure>, _ b: Result<B, Failure>) -> Result<(A, B), Failure>
{
  a.flatMap { a in
    b.flatMap { b in
      .success((a, b))
    }
  }
}
