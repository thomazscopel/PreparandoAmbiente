import Foundation

func showMenu() {
    print("""
    ************************************
              MENU DE OPÇÕES
    ************************************
    1. Adicionar Tarefa
    2. Remover Tarefa
    3. Mostrar Tarefas
    4. Atualizar Tarefas
    5. Sair
    
    Digite sua opção:
    """, terminator: "")
}

func mostrarTarefas(lista: [String]) {
    print("\n--- Suas Tarefas ---")
    if !lista.isEmpty {
        for (index, tarefa) in lista.enumerated() {
            print("\(index). \(tarefa)")
        }
    } else {
        print("Nenhuma tarefa na lista.")
    }
    print("--------------------")
}


func adicionarTarefa(lista: inout [String]) {
    
    var adiciona = true
    
    // Repete enquanto o usuario quiser adicionar para multiplas tarefas
    repeat {
        mostrarTarefas(lista: lista)
        print("Digite sua nova tarefa ou digite 'v' para voltar: ")
        guard var linha = readLine() else {
            print("Nenhuma entrada identificada! Retornando ao Menu.")
            return
        }
        
        // Faz o tratamento da entrada
        linha = linha.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if linha.lowercased() == "v" {
            adiciona = false
        } else if linha.isEmpty { // Verifica se eh uma entrada vazia
            print("A tarefa não pode ser vazia! Por favor digite algo.")
        } else {
            let tarefa = linha
            lista.append(tarefa)
        }
        
    } while adiciona
}

func removerTarefa(lista: inout [String]) {
    
    var remove = true
    
    // Repete enquanto o usuario quiser remover para multiplas tarefas
    repeat {
        if (lista.isEmpty) {
            print("Nada para remover, lista vazia!!")
            return
        }
        
        mostrarTarefas(lista: lista) 
        print("Digite o número da tarefa que deseja remover ( ou 'v' para voltar): ", terminator: "")
        
        guard var linha = readLine() else {
            print("Nenhuma entrada identificada! Retornando ao Menu.")
            return
        }
        
        // Faz o tratamento da entrada
        linha = linha.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if linha.lowercased() == "v" {
            remove = false
        } else if linha.isEmpty { // Verifica se eh entrada vazia
            print("A entrada não pode ser vazia! Por favor digite algo.")
        } else {
            if let indiceTarefaRemovida = Int(linha) { // Verifica se a entrada foi um numero
                // Verifica se o indice esta dentro do intervalo do array
                if indiceTarefaRemovida >= 0 && indiceTarefaRemovida < lista.count {
                    lista.remove(at: indiceTarefaRemovida)
                } else {
                    print("Indice inexistente! Digite no intervalo de tarefas!")
                }
            } else {
                print("Entrada inválida! Por favor digite um número!")
            }
        }
        
    } while remove
    
}

// FIM DE FUNCOES

// main()

var opcao: Int = 0 
var listaTarefas: [String] = []

// Loop para verificar uma entrada válida
repeat {
    showMenu()
    guard let input = readLine() else {
        print("Nenhuma entrada identificada, encerrando programa!")
        exit(0) 
    }

    if let numOpcao = Int(input) {
        // Atribui o valor lido a 'opcao' se for um número válido
        opcao = numOpcao
        
        if opcao < 1 || opcao > 5 {
            print("Opção Inválida! Deve inserir um número entre 1 e 5.")
        } else {
            switch opcao {
                case 1: adicionarTarefa(lista: &listaTarefas)
                case 2: removerTarefa(lista: &listaTarefas)
                case 3: mostrarTarefas(lista: listaTarefas)
                case 4: print("To do")
                case 5:
                    print("Encerrando programa...")
                    exit(0)
                default:
                    print("Comportamento inesperado. Reiniciando Menu..")
            }
        }
    } else {
        // Se a entrada não for um número, imprime erro e mantém 'opcao' inválida
        print("Entrada inválida! Por favor, digite um número.")
    }
    
    opcao = 0 // Atribui valor fora do intervalo para permanencia do loop

} while opcao < 1 || opcao > 5 // O loop continua enquanto a opcao for inválida
