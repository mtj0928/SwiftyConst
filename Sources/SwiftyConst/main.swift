import ArgumentParser
import ColorizeSwift
import Foundation
import SwiftSyntax

struct SwiftyConst: ParsableCommand {

    @Option(name: .shortAndLong, help: "Output path")
    var output: String?

    @Argument(help: "Input path")
    var input: String

    mutating func run() throws {
        let inputURL = URL(fileURLWithPath: input)
        let root = try SyntaxParser.parse(inputURL)
        let rewriter = ConstRewriter(inputURL)
        let rewritedRoot = rewriter.visit(root)

        print("Succeed in embedding some constants.".green().bold())

        if let outputPath = output.flatMap(URL.init(fileURLWithPath:)) {
            try rewritedRoot.description
                .write(to: outputPath, atomically: true, encoding: .utf8)
            print("Embed swift file is generated to \(output!).")
            print("🚨 Don't forgot to add the file to .gitignore!".red().bold())
        } else {
            print("")
            print(rewritedRoot)
        }
    }
}


SwiftyConst.main()
