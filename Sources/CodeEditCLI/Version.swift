//
//  Version.swift
//  CodeEditCLI
//
//  Created by Lukas Pistrol on 06.12.22.
//

import ArgumentParser
import Foundation

extension CodeEditCLI {
    struct Version: ParsableCommand {
        static var configuration = CommandConfiguration(
            commandName: "version",
            abstract: "Prints the version of the CLI and CodeEdit.app."
        )

        func run() throws {
            // Run an apple script to find CodeEdit.app
            let pathData = try codeEditURLData()

            // Check if there is an Info.plist inside CodeEdit.app
            // Then get the version number and print it out
            //
            // This will fail when CodeEdit.app is not installed
            if let url = infoPlistUrl(pathData: pathData),
               let plist = NSDictionary(contentsOf: url) as? [String: Any],
               let version = plist["CFBundleShortVersionString"] as? String {
                print("CodeEdit.app: \t\(version)")
            } else {
                print("CodeEdit.app is not installed.")
            }

            // Print the cli version
            print("CodeEditCLI: \t\(CLI_VERSION)")
        }

        private func codeEditURLData() throws -> Data {
            let task = Process()
            let pipe = Pipe()
            task.standardOutput = pipe
            task.launchPath = "/usr/bin/osascript"

            task.arguments = ["-e"]
            task.arguments?.append("POSIX path of (path to application \"CodeEdit\")")

            try task.run()

            return pipe.fileHandleForReading.readDataToEndOfFile()
        }

        private func infoPlistUrl(pathData: Data) -> URL? {
            if let path = String(data: pathData, encoding: .utf8) {
                let url = URL(fileURLWithPath: path.trimmingCharacters(in: .whitespacesAndNewlines))
                    .appendingPathComponent("Contents")
                    .appendingPathComponent("Info.plist")
                return url
            } else {
                return nil
            }
        }
    }
}
