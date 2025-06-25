// Estudando Arrays
import Foundation

// Exercicio 1 - concatenar arrays
func aula6ex1() {
    var nums1: [Int] = [1,2,3,4,5]
    let nums2: [Int] = [6,7,8,9,10]

    let c = nums2.count

    for elemento in 0..<c{
        nums1.append(nums2[elemento])
    }

    print(nums1)
}

// Exercicio 2 - soma valores do array
func aula6ex2 () {
    let nums: [Int] = [10, 20, 5, 15, 30]

    var count: Int = 0 

    for element in 0..<nums.count {
        count += nums[element]
    }

    print(count)
}

// Exercicio 3 - imprimir valores pares num array
func aula6ex3 () {
    let nums: [Int] = [10, 20, 5, 15, 30]

    print("[", terminator: "")
    for element in 0..<nums.count {
        if (nums[element] % 2 == 0) {
            print(" \(nums[element]) ", terminator: "")
        }
    }
    print("]", terminator: "")
}

// Exercicio 4 - imprimir elementos divisiveis por 3 e por 5
func aula6ex4() {
    let nums: [Int] = [10, 20, 5, 15, 30]

    print("[", terminator: "")
    for element in 0..<nums.count {
        if (nums[element] % 3 == 0 && nums[element] % 5 == 0) {
            print(" \(nums[element]) ", terminator: "")
        }
    }
    print("]", terminator: "")
}

// Exercicio 5 - imprimir a interseccao de elementos entre arrays
func aula6ex5() {
    let nums: [Int] = [10, 20, 5, 15, 30]
    let nums1: [Int] = [1, 2, 5, 15, 3]


    print("[", terminator: "")
    for element in 0..<nums.count {
        if (nums[element] == nums1[element]) {
            print(" \(nums[element]) ", terminator: "")
        }
    }
    print("]", terminator: "")
}

// Exercicio 6 - remover numeros duplicados em um array
func aula6ex6() {
    let nums: [Int] = [1,1,2,2,3,4,5,5,5,6,7,8,8,9]
    var result: [Int] = []

    let tam = nums.count

    for i in 0..<tam-1 {
        if (nums[i] == nums[i+1]) {
            continue
        }
        result.append(nums[i])
        
        if (i == tam-2) {
            result.append(nums[tam-1])
        }
    }

    print(result)
}

func aula6ex7() {
    var nums: [Int] = [1, 2, 3, 5, 10, 9, 7, 6, 8, 4]

    nums.sort()

    let meio = Int(floor(Double(nums.count/2)))

    var mediana: Double = 0 

    if nums.count % 2 == 0 {
        mediana = (Double(nums[meio] + nums[meio-1]))/2
    } else {
        mediana = Double(nums[meio])
    }

    print("Lista: ", nums)
    print("Mediana: ", mediana)
}