//
//  Open.swift
//  CodeEditCLI
//
//  Created by Lukas Pistrol on 06.12.22.
//

import ArgumentParser
import Foundation

extension CodeEditCLI {
    struct Open: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "open",
            abstract: "A command-line tool to open files/folders in CodeEdit.app."
        )

        @Argument(
            help: "The path of a file/folder to open.",
            completion: .file()
        )
        private var path: String?

        @Option(name: .shortAndLong, help: "The line number to open a file at. Optional.")
        private var line: Int?

        @Option(name: .shortAndLong, help: "The column to open a file at. Optional.")
        private var column: Int?

        func run() throws {
            let task = Process()

            // use the `open` cli as the executable
            task.launchPath = "/usr/bin/open"

            if let path {

                let openURL = try absolutePath(path, for: task)

                // open CodeEdit using the url scheme
                if let line, !openURL.hasDirectoryPath {
                    task.arguments = ["-u", "codeedit://\(openURL.path):\(line):\(column ?? 1)"]
                } else {
                    task.arguments = ["-u", "codeedit://\(openURL.path)"]
                }
            } else {
                task.arguments = ["-a", "CodeEdit.app"]
            }

            try task.run()
        }

        private func absolutePath(_ path: String, for task: Process) throws -> URL {
            guard let workingDirectory = task.currentDirectoryURL,
                  let url = URL(string: path, relativeTo: workingDirectory) else {
                throw CLIError.invalidWorkingDirectory
            }
            return url
        }
    }
}
