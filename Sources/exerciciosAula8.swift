// Estudando optionals

// Exercicio 1
func aula8ex1() {
    print("Digite algo: ", terminator: "")
    let input: String? = readLine()

    if let input = input {
        print("A palavra '\(input)' foi lida com sucesso")
    } else {
        print("A entrada estava vazia!")
    }
}


func aula8ex2() {
    
}
