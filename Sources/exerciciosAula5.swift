// Estudando loops

// Programa que apresente a taboada (até 10) de um num escolhido pelo usuario
func exercicio1() {
    print("Insira um numero: ", terminator: "")
    var num = Int(readLine()!)!

    while (num < 0 || num > 10) {
        print("Numero fora do intervalo!! Insira outro numero: ", terminator: "")
        num = Int(readLine()!)!
    }

    for i in 1...10 {
        let result = num * i
        print("\(num) x \(i) = \(result)")
    }
}

// Programa que diga a qtde de numeros pares até o num inserido pelo usuario
func exercicio2() {
    print("Insira um numero: ", terminator: "")
    let num = Int(readLine()!)!

    var i = 1
    var contagem = 0

    while i <= num {
        if i % 2 == 0 {
            contagem += 1
        }
        i += 1
    }

    print("Existem \(contagem) numeros pares até \(num).")
}

// Programa de adivinhar um numero e mostrar sua tabuada
func exercicio3() {
    let num = Int.random(in:1...10)

    print("Sorteie um numero de 1 a 10: ", terminator: "")
    var sorteado = Int(readLine()!)!

    var acertou = false
    while !acertou {
        if sorteado == num {
            print("Voce acertou! Imprimindo a tabuada de \(num)!")
            for i in 1...10 {
                let result = i*num
                print("\(i)X\(num) = \(result)")
            } 
            acertou = true
            break
        }
        print("Errou! Sorteie mais um numero de 1 a 10: ", terminator: "")
        sorteado = Int(readLine()!)!
    }
}