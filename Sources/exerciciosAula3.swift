import Foundation

func aula3() {

    //Exercicio 1 - Conversao de temperatura 
    print("*****************************************************")
    print("Exercicio 1 - Conversao de temperatura")

    print("Insira uma temperatura em graus Celsius: ", terminator:"")
    let Celsius = Double(readLine()!)!

    let Fahrenheit: Double = (Celsius * (9/5)) + 32

    print(String(format: "F = %.2f", Fahrenheit))

    //Exercicio 2 - Media Ponderada
    print("*****************************************************")
    print("Exercicio 2 - Media Ponderada")

    print("Insira a primeira nota: ", terminator:"")
    let nota1 = Double(readLine()!)!

    print("Insira a segunda nota: ", terminator:"")
    let nota2 = Double(readLine()!)!

    let media = ((nota1*3) + (nota2*2))/5

    print(String(format: "M = %.2f", media))

    // Exercicio 3 - Valor total de produtos
    print("*****************************************************")
    print("Exercicio 3 - Valor total de produtos")

    print("Insira o nome do produto: ", terminator:"")
    let nomeProduto = readLine()!

    print("Insira o valor unitario do produto: ", terminator:"")
    let valorProduto = Double(readLine()!)!

    print("Insira a quantidade comprada: ", terminator:"")
    let qtdeComprada = Int(readLine()!)!

    let valorTotal = valorProduto * Double(qtdeComprada)

    print(String(format:"Mostre Total \(nomeProduto) = R$ %.2f", valorTotal))

    // Exercicio 4 - Area do Retangulo
    print("*****************************************************")
    print("Exercicio 4 - Area do Retangulo")

    print("Insira a altura do retangulo: ", terminator:"")
    let altura = Double(readLine()!)!

    print("Insira a largura do retangulo: ", terminator:"")
    let largura = Double(readLine()!)!

    let areaRetangulo = altura*largura

    print(String(format:"Mostre Area = %.2f", areaRetangulo))
    print("*****************************************************")
}

aula3()