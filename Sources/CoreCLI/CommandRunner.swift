//
//  CommandRunner.swift
//  CoreCLI
//
//  Created by Toshihiro Suzuki on 2018/07/30.
//

import Foundation

// TODO: Copy command runner logic from cmdshelf.

// Returns named script path from inferred location depending on install tool.
// In case of debugging, put your scripts under `Sources/Scripts/`.
public func pathForShellScript(named scriptName: String) -> String {
    let toolName = ProcessInfo.processInfo.arguments[0].split(separator: "/").last!

    let executableDir: String = {
        let path = "\(Bundle.main.bundlePath)/\(toolName)"
        let fm = FileManager.default
        let executablePath = (try? fm.destinationOfSymbolicLink(atPath: path)) ?? path
        let joined = executablePath.split(separator: "/").dropLast().joined(separator: "/")
        if executablePath.hasPrefix("/") {
            return "/\(joined)"
        } else {
            return joined
        }
    }()

    if executableDir.contains(".build") {
        // spm debug
        return "\(executableDir)/../../../Sources/Scripts/\(scriptName)"
    } else if executableDir.contains("Library/Developer/Xcode/DerivedData") {
        // Xcode
        fatalError("Executing a script while debugging with Xcode is not supported. Please use SPM from commandline.")
    } else if executableDir.contains("lib/mint/packages") {
        // mint install
        return "\(executableDir)/\(scriptName)"
    } else {
        // install.sh
        return "\(executableDir)/../share/\(toolName)/\(scriptName)"
    }
}
