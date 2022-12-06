//
//  main.swift
//  CodeEditCLI
//
//  Created by Lukas Pistrol on 06.12.22.
//

import ArgumentParser
import Foundation

// ##################################################
//  This needs to be changed prior to every release!
// ##################################################
let CLI_VERSION = "0.0.3"

struct CodeEditCLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "codeedit-cli",
        abstract: """
        A set of command line tools that ship with CodeEdit
        which allow users to open and interact with editor via the command line.

        Version: \(CLI_VERSION)
        """,
        subcommands: [Open.self, Version.self],
        defaultSubcommand: Open.self
    )

    init() {}

    enum CLIError: Error {
        case invalidWorkingDirectory
    }
}

CodeEditCLI.main()
