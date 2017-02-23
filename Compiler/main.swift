//
//  main.swift
//  Compiler
//
//  Created by Janum Trivedi on 2/16/17.
//  Copyright © 2017 Janum Trivedi. All rights reserved.
//

if let source = Loader.read(file: "/Users/janum/Dropbox/Development/Teddy/Compiler/main.teddy") {
    
    String.printHeader(text: "Source Input")
    print(source)
    

    String.printHeader(text: "Lexical Analysis")
    let tokens = Lexer.tokenize(input: source)
    tokens.forEach { print($0) }

    
    String.printHeader(text: "Parsing & Semantic Analysis")
    
    let parser = Parser(tokens: tokens)
    let ast = try parser.parse()
    print(ast)

    
    
    String.printHeader(text: "Code Generation (Target: C++)")
    
    let generator = CodeGenerator(abstractSyntaxTree: ast)
    try generator.emit(to: .c)
    
    print()
}
