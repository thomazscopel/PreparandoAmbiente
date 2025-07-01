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


func adicionarTarefa(lista: [String], tarefa: String) -> [String] {
    var listaAux = lista
    let tarefaAdicionada = tarefa.trimmingCharacters(in: .whitespacesAndNewlines)

    if tarefaAdicionada.isEmpty {
        print("Não pode adicionar tarefa vazia!")
    } else {
        listaAux.append(tarefa)
    }
    return listaAux
}

func removerTarefa(lista: [String], indice: Int) -> [String] {
    var listaAux = lista
    if lista.isEmpty {
        print("Nada para remover, lista vazia!!")
    } else if indice >= 0 && indice < lista.count {
        listaAux.remove(at: indice)
        print("Tarefa removida com sucesso")
    } else {
        print("Indice fora de intervalo!")
    }
    return listaAux
}

func editarTarefas(lista: [String], indice: Int, texto: String) -> [String]? {
    var listaAux = lista
    if lista.isEmpty {
        print("Nada para editar, lista vazia!!")
    } else if indice >= 0 && indice < lista.count {
        listaAux[indice] = texto
        print("Tarefa editada com sucesso!")
        return listaAux
    } else {
        print("Indice fora de intervalo!")
    }
    return nil
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
                case 1: 
                    listarTarefas(lista: listaTarefas)
                case 2:
                    var adiciona = true
                    
                    // Repete enquanto o usuario quiser adicionar para multiplas tarefas
                    repeat {
                        listarTarefas(lista: listaTarefas)
                        print("Digite sua nova tarefa ou digite 'v' para voltar: ")
                        guard let linha = readLine() else {
                            print("Nenhuma entrada identificada!")
                            exit(1)
                        }                        
                                               
                        if linha.lowercased() == "v" {
                            adiciona = false
                        } else {
                            let tarefa = linha                            
                            listaTarefas = adicionarTarefa(lista: listaTarefas, tarefa: tarefa)
                        }
                        
                    } while adiciona

                case 3: 
                    var remove = true
                    
                    // Repete enquanto o usuario quiser remover para multiplas tarefas
                    repeat {                                               
                        listarTarefas(lista: listaTarefas) 
                        print("Digite o número da tarefa que deseja remover ( ou 'v' para voltar): ", terminator: "")
                        
                        guard let linha = readLine() else {
                            print("Nenhuma entrada identificada!")
                            exit(1)
                        }
                                               
                        if linha.lowercased() == "v" {
                            remove = false
                        } else {
                            if let indiceTarefaRemovida = Int(linha) { // Verifica se a entrada foi um numero
                                listaTarefas = removerTarefa(lista: listaTarefas, indice: indiceTarefaRemovida)
                            } else {
                                print("Entrada inválida! Por favor digite um número!")
                            }
                        }
                        
                    } while remove
                case 4: 
                    listarTarefas(lista: listaTarefas)
                    print("Digite o índice da tarefa que deseja editar (ou 'v' para voltar): ", terminator: "")

                    guard let input = readLine() else {
                        print("Nenhuma entrada identificada!")
                        exit(1)
                    }

                    if input.lowercased() != "v" {
                        if let indiceTarefaEditar = Int(input) {
                            
                        }
                    }

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
