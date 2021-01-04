import ArgumentParser
import Foundation
import Logging
import SwiftSyntax

let logger = Logger(label: "SwiftyConst")

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
        logger.info("Succeed in embedding some constants.")

        if let outputPath = output.flatMap(URL.init(fileURLWithPath:)) {
            try rewritedRoot.description
                .write(to: outputPath, atomically: true, encoding: .utf8)
            logger.info("Embed swift file is generated to \(output!).")
        } else {
            print("")
            print(rewritedRoot)
        }
    }
}


SwiftyConst.main()
