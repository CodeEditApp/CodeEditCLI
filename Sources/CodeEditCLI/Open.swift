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
            help: """
            The path of a file/folder to open.
            When opening files, line and column numbers can be appended: `index.html:42:10`
            """,
            completion: .file()
        )
        private var path: String?

        func run() throws {
            let task = Process()

            // use the `open` cli as the executable
            task.launchPath = "/usr/bin/open"

            if let path {
                let (path, line, column) = try extractLineColumn(path)
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

        private func extractLineColumn(_ path: String) throws -> (path: String, line: Int?, column: Int?) {
            let components = path.split(separator: ":")
            let path = String(components[0])

            switch components.count {
            case 1:
                return (path, nil, nil)
            case 2:
                guard let row = Int(components[1]) else { throw CLIError.invalidFileURL }
                return (path, row, nil)
            case (3...):
                guard let row = Int(components[1]),
                      let column = Int(components[2]) else { throw CLIError.invalidFileURL }
                return (path, row, column)
            default:
                throw CLIError.invalidFileURL
            }
        }
    }
}
