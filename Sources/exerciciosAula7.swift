// Estudando funcoes

import Foundation

// funcao de retornar dobro de um valor
func dobro(a: Int) -> Int {
    return a*2
}


// funcao de media aritmetica
func media(a: Double, b: Double) -> Double {
    return (a+b)/2
}

/*
print("Digite duas notas: ", terminator: "")
let input = readLine()!
let c = input.split(separator: " ")

print(media(a: Double(c[0])!, b: Double(c[1])!))
*/


// funcao que verifica ano bissexto
func ehBissexto(ano: Int) -> Bool {
    if (ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0)) {
        return true
    } else {
        return false
    }
}

/*
print("Insira um ano: ", terminator: "")
let a = Int(readLine()!)!

if ehBissexto(ano: a) {
    print("É um ano bissexto!")
} else {
    print("Não é um ano bissexto!")
}
*/

func calculaIMC(peso: Double, altura: Double) {
    let imc = peso/(altura*altura)
    
    switch imc {
        case 0..<18.5: 
            print(String(format:"Seu imc é de %.3f, e indica Abaixo do Peso Normal",imc))
        case 18.5..<25:
            print(String(format:"Seu imc é de %.3f, e indica Peso Normal",imc))
        case 25..<30:
            print(String(format:"Seu imc é de %.3f, e indica Sobrepeso",imc))
        case 30...:
            print(String(format:"Seu imc é de %.3f, e indica Obesidade",imc))
        default:
            print(String(format:"Seu imc é %.3f",imc))
    }
}

/*
print("Insira seu peso e sua altura: ", terminator: "")
let input = readLine()!
let c = input.split(separator: " ")

let peso = Double(c[0])!
let altura = Double(c[1])!

calculaIMC(peso: peso, altura: altura)
*/

// Funcao que calcula o preco final com desconto e imposto
func calculaPreco(preco: Double, desconto: Double, imposto: Double) -> Double {
    var precoFinal = preco
    precoFinal -= ((precoFinal*desconto)/100)
    precoFinal += ((precoFinal*imposto)/100)
    return precoFinal
}

/*
print("Insira o preco do produto: ", terminator: "")
let preco = Double(readLine()!)!

print("Insira o desconto do produto: ", terminator: "")
let desconto = Double(readLine()!)!

print("Insira a taxa de imposto do produto: ", terminator: "")
let imposto = Double(readLine()!)!

let precoFinal = calculaPreco(preco: preco, desconto: desconto, imposto: imposto)
print("O preco final de compra eh \(precoFinal)")
*/