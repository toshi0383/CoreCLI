//
//  AutoArgumentsDecodable.swift
//  CoreCLI
//
//  Created by 鈴木俊裕 on 2018/07/25.
//

public protocol AutoArgumentsDecodable {
    static var defaultSubCommand: CommandType.Type? { get }
    static var subCommands: [CommandType.Type] { get }
    static var shortHandOptions: [PartialKeyPath<Self>: Character] { get }
    static var shortHandFlags: [KeyPath<Self, Bool>: Character] { get }
    static var shortHandCommands: [String: CommandType.Type] { get }
}

extension AutoArgumentsDecodable {
    public static var defaultSubCommand: CommandType.Type? { return nil }
    public static var subCommands: [CommandType.Type] { return [] }
    public static var shortHandOptions: [PartialKeyPath<Self>: Character] { return [:] }
    public static var shortHandFlags: [KeyPath<Self, Bool>: Character] { return [:] }
    public static var shortHandCommands: [String: CommandType.Type] { return [:] }
}
