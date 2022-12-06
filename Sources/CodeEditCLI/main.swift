//
//  main.swift
//  CodeEditCLI
//
//  Created by Lukas Pistrol on 06.12.22.
//

import ArgumentParser
import Foundation

struct CodeEditCLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "codeedit-cli",
        abstract: "A command-line tool to open files/folders in CodeEdit.app."
    )

    @Argument(
        help: "The path of a file/folder to open.",
        completion: .file()
    )
    private var path: String

    @Option(name: .shortAndLong, help: "The line number to open a file at. Optional.")
    private var line: Int?

    @Option(name: .shortAndLong, help: "The column to open a file at. Optional.")
    private var column: Int?

    init() {}

    func run() throws {
        let task = Process()
        let openURL = try absolutePath(for: task)

        // use the `open` cli as the executable
        task.launchPath = "/usr/bin/open"

        // open CodeEdit using the url scheme
        if let line, !openURL.hasDirectoryPath {
            task.arguments = ["-u", "codeedit://\(openURL.path):\(line):\(column ?? 1)"]
        } else {
            task.arguments = ["-u", "codeedit://\(openURL.path)"]
        }

        try task.run()
    }

    private func absolutePath(for task: Process) throws -> URL {
        guard let workingDirectory = task.currentDirectoryURL,
              let url = URL(string: path, relativeTo: workingDirectory) else {
            throw CLIError.invalidWorkingDirectory
        }
        return url
    }

    enum CLIError: Error {
        case invalidWorkingDirectory
    }
}

CodeEditCLI.main()
