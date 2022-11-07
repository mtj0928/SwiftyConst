import ArgumentParser
import SwiftSyntaxParser
import ColorizeSwift
import Foundation
import SwiftSyntax

struct SwiftyConst: ParsableCommand {

    @Option(name: .shortAndLong, help: "Output path")
    var output: String?

    @Argument(help: "Input path")
    var input: String

    @Option(name: .shortAndLong, help: "Yaml file which have value map")
    var environment: String?

    mutating func run() throws {
        let inputURL = URL(fileURLWithPath: input)
        let root = try SyntaxParser.parse(inputURL)
        let provider = createConstProvider()
        let rewriter = ConstRewriter(inputURL, with: provider)
        let rewrittenRoot = rewriter.visit(root)

        print("Succeed in embedding some constants.".green().bold())

        if let outputPath = output.flatMap(URL.init(fileURLWithPath:)) {
            try rewrittenRoot.description
                .write(to: outputPath, atomically: true, encoding: .utf8)
            print("Embed swift file is generated to \(output!).")
            print("Don't forgot to add the file to .gitignore!".magenta().bold())
        } else {
            print("")
            print(rewrittenRoot)
        }
    }

    private func createConstProvider() -> ConstProvider {
        if let url = environment.flatMap(URL.init(fileURLWithPath:)),
           let provder = try? YamlValueProvider(contentsOf: url) {
            return provder
        }
        return EnvironmentValueProvider()
    }
}


SwiftyConst.main()
