import Foundation

func showMenu() {
    print("""
    === Lista de Tarefas ===
    1 - Listar tarefas
    2 - Adicionar tarefa
    3 - Remover tarefa
    4 - Editar tarefa
    0 - Sair
    Escolha uma opção:
    """, terminator: "")
}

func listarTarefas(lista: [String]) {
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
        listarTarefas(lista: lista)
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
        
        listarTarefas(lista: lista) 
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

func editarTarefas(lista: inout [String]) {
    if lista.isEmpty {
        print("Lista vazia nada para editar! Retornando ao Menu")
        return
    }

    var editando = true

    repeat {
        listarTarefas(lista: lista)

        print("Digite o numero da tarefa que gostaria de editar(ou 'v' para voltar): ", terminator: "")
        guard var linha = readLine() else {
            print("Nenhuma entrada identificada! Retornando ao Menu.")
            return
        }

        linha = linha.trimmingCharacters(in: .whitespacesAndNewlines)

        if linha.lowercased() == "v" {
            return
        }

        if let indiceTarefaEditar = Int(linha) {
            if indiceTarefaEditar >= 0 && indiceTarefaEditar < lista.count {
                print("Editando Tarefa \(indiceTarefaEditar)...")

                repeat {
                    print("Digite o novo texto (ou 'v' para voltar): ")
                    
                    guard var textoEditado = readLine() else {
                        print("Nenhuma entrada identificada! Retornando ao Menu.")
                        return
                    }

                    textoEditado = textoEditado.trimmingCharacters(in: .whitespacesAndNewlines)

                    if textoEditado.isEmpty {
                        print("Não é permitido atualizar tarefa por entrada vazia!")
                    } else if textoEditado.lowercased() == "v" {
                        break
                    } else {
                        lista[indiceTarefaEditar] = textoEditado
                        print("Texto editado com sucesso!")
                        editando = false
                    }
                } while editando

            } else {
                print("Entrada fora do intervalo de tarefas!")
            }
        } else {
            print("Entrada inválida! Por favor insira um número.")
        }
    } while editando
}

// FIM DE FUNCOES

// main()

var opcao: Int = -1 
var listaTarefas: [String] = []

// Loop para verificar uma entrada válida
repeat {
    showMenu()
    guard let input = readLine() else {
        print("\nNenhuma entrada identificada, encerrando programa!")
        exit(0) 
    }

    if let numOpcao = Int(input) {
        // Atribui o valor lido a 'opcao' se for um número válido
        opcao = numOpcao
        
        if opcao < 0 || opcao > 4 {
            print("Opção Inválida! Deve inserir um número entre 0 e 4.")
        } else {
            switch opcao {
                case 1: listarTarefas(lista: listaTarefas)
                case 2: adicionarTarefa(lista: &listaTarefas)
                case 3: removerTarefa(lista: &listaTarefas)
                case 4: editarTarefas(lista: &listaTarefas)
                case 0:
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
    
    opcao = -1 // Atribui valor fora do intervalo para permanencia do loop

} while opcao < 0 || opcao > 4 // O loop continua enquanto a opcao for inválida
