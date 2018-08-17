import Foundation

public protocol ArgumentParserType: class {
    var executablePath: String { get }
    var remainder: [String] { get set }
    func getValue(forOption option: String) throws -> String
    func getFlag(_ flag: String) -> Bool
}

extension ArgumentParserType {

    @discardableResult
    public func shift() -> String? {
        if remainder.isEmpty {
            return nil
        }
        return remainder.removeFirst()
    }

    @discardableResult
    public func shift(at index: Int) -> String? {
        if remainder.isEmpty {
            return nil
        }

        if index < remainder.count {
            return remainder.remove(at: index)
        } else {
            return nil
        }
    }

    @discardableResult
    public func shiftAll() -> [String] {
        let r = remainder
        remainder = []
        return r
    }

}

/// Default ArgumentParser
public final class ArgumentParser: ArgumentParserType {

    public let executablePath: String

    public func getValue(forOption option: String) throws -> String {

        guard let index = remainder.index(of: option) else {
            throw CommandError("missing option \(option)")
        }
        if index + 1 > remainder.count {
            throw CommandError("missing value for option \(option)")
        }
        shift(at: index)
        return shift(at: index)!
    }

    public func getFlag(_ flag: String) -> Bool {

        if let index = remainder.index(of: flag) {
            shift(at: index)
            return true
        } else {
            return false
        }
    }

    public var remainder: [String]

    /// - parameter arguments: ProcessInfo.processInfo.arguments
    public init(arguments: [String] = ProcessInfo.processInfo.arguments) {
        if let first = arguments.first {
            self.executablePath = first
        } else {
            fatalError("first argument is missing")
        }
        self.remainder = Array(arguments.dropFirst())
    }
}
