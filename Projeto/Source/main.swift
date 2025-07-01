import Foundation

func showMenu() {
    print("""
    === Lista de Tarefas ===
    1 - Listar tarefas
    2 - Adicionar tarefa
    3 - Remover tarefa
    4 - Editar tarefa
    5 - Mudar prioridade 
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
    if indice >= 0 && indice < lista.count {
        listaAux.remove(at: indice)
        print("Tarefa removida com sucesso")
    } else {
        print("Indice fora de intervalo!")
    }
    return listaAux
}

func editarTarefas(lista: [String], indice: Int, texto: String) -> [String]? {
    var listaAux = lista
    let textoTratado = texto.trimmingCharacters(in: .whitespacesAndNewlines)
    if lista.isEmpty {
        print("Nada para editar, lista vazia!!")
        return nil
    } else if textoTratado.isEmpty {
        print("Nao eh permitido editar por texto vazio!")
        return nil
    } else {
        listaAux[indice] = texto
        print("Tarefa editada com sucesso!")
        listarTarefas(lista: listaAux)
        return listaAux
    } 
}


func mudarPrioridade(lista: [String], i indiceDesejado: Int, j indiceMudar: Int) -> [String] {
    var listaAux = lista

    let aux = listaAux[indiceDesejado]
    listaAux[indiceDesejado] = listaAux[indiceMudar]
    listaAux[indiceMudar] = aux

    return listaAux
}

// FIM DE FUNCOES

// main()

// Declaração de atributos principais
var opcao: Int = -1 
var listaDeTarefas: [String] = []

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
        
        if opcao < 0 || opcao > 5 {
            print("Opção Inválida! Deve inserir um número entre 0 e 4.")
        } else {
            switch opcao {
                // LISTAR TAREFAS
                case 1: 
                    listarTarefas(lista: listaDeTarefas)
                
                // ADICIONAR TAREFAS
                case 2:
                    var adiciona = true
                    
                    // Repete enquanto o usuario quiser adicionar para multiplas tarefas
                    repeat {
                        listarTarefas(lista: listaDeTarefas)
                        print("Digite sua nova tarefa ou digite 'v' para voltar: ")
                        guard let linha = readLine() else {
                            print("Nenhuma entrada identificada!")
                            exit(1)
                        }                        
                                               
                        if linha.lowercased() == "v" {
                            adiciona = false
                        } else {
                            let tarefa = linha                            
                            listaDeTarefas = adicionarTarefa(lista: listaDeTarefas, tarefa: tarefa)
                        }
                        
                    } while adiciona

                // REMOVER TAREFAS
                case 3: 
                    var remove = true
                    
                    // Repete enquanto o usuario quiser remover para multiplas tarefas
                    repeat {       
                        if !listaDeTarefas.isEmpty {
                            listarTarefas(lista: listaDeTarefas) 
                            print("Digite o número da tarefa que deseja remover ( ou 'v' para voltar): ", terminator: "")
                            
                            guard let linha = readLine() else {
                                print("Nenhuma entrada identificada!")
                                exit(1)
                            }
                                                
                            if linha.lowercased() == "v" {
                                remove = false
                            } else {
                                if let indiceTarefaRemovida = Int(linha) { // Verifica se a entrada foi um numero
                                    listaDeTarefas = removerTarefa(lista: listaDeTarefas, indice: indiceTarefaRemovida)
                                } else {
                                    print("Entrada inválida! Por favor digite um número!")
                                }
                            }
                        } else {
                            listarTarefas(lista: listaDeTarefas)
                            print("Nada para remover, lista vazia...")
                            remove = false
                        }                                       
                        
                    } while remove

                // EDITAR TAREFAS
                case 4:
                    var terminouEditar = false
                    
                    // Repete enquanto o usuario nao fornecer um indice valido para ser editado
                    repeat {
                        listarTarefas(lista: listaDeTarefas)
                        print("Digite o índice da tarefa que deseja editar (ou 'v' para voltar): ", terminator: "")

                        guard let input = readLine() else {
                            print("Nenhuma entrada identificada!")
                            exit(1)
                        }

                        // Se receber 'v' volta ao Menu 
                        if input.lowercased() != "v" {
                            if let indiceTarefaEditar = Int(input) {
                                if indiceTarefaEditar >= 0 && indiceTarefaEditar < listaDeTarefas.count { // Verifica se o intervalo do indice eh valido
                                    var editando = true 

                                    // Repete enquanto estiver 'editando' uma tarefa
                                    repeat {
                                        listarTarefas(lista: listaDeTarefas) // Mostra lista para dar feedback visual da edição
                                        print("Editando tarefa \(indiceTarefaEditar)")
                                        print("Digite o texto editado (ou 'v' para voltar): ")
                                        guard let novoTexto = readLine() else {
                                            print("Nenhuma entrada identificada")
                                            exit(1)
                                        }

                                        if novoTexto.lowercased() != "v" { // Se for 'v' volta uma etapa e quebra este loop
                                            let editado: [String]? = editarTarefas(lista: listaDeTarefas, indice: indiceTarefaEditar, texto: novoTexto)
                                            if editado != nil { // Se editado nao for nulo, a funcao teve exito, quebra o loop e atualiza listaDeTarefas
                                                listaDeTarefas = editado!
                                                editando = false
                                                terminouEditar = true // Altera flag do loop de terminar uma edicao
                                            }
                                        } else {
                                            editando = false
                                        }
                                    } while editando
                                } else {
                                    print("Indice fora do intervalo!!")
                                }
                            } else {
                                print("A entrada precisa ser um número!!")
                            }
                        } else {
                            break
                        }
                    } while !terminouEditar

                case 5:
                    // verifica se existe mais de um item para poder trocar de lugar
                    if listaDeTarefas.count > 1 {
                        listarTarefas(lista: listaDeTarefas)
                        print("Digite o indice que deseja mudar e sua nova posição (separe por espaço): ", terminator: "")

                        guard let input = readLine() else {
                            print("Nenhuma entrada identificada!")
                            exit(1)
                        }

                        let inputSeparado = input.split(separator: " ")

                        if let indiceMudar = Int(inputSeparado[0]) {
                            if let indiceDesejado = Int(inputSeparado[1]) {
                                // Verificar se os indices sao validos
                                if indiceMudar >= 0 && indiceMudar < listaDeTarefas.count {
                                    if indiceDesejado >= 0 && indiceDesejado < listaDeTarefas.count {
                                        listaDeTarefas = mudarPrioridade(lista: listaDeTarefas, i: indiceDesejado, j: indiceMudar)
                                        print("Ordem trocada com sucesso!")
                                        listarTarefas(lista: listaDeTarefas)
                                    } else {
                                        print("Segundo indice fora de intervalo!")
                                    }
                                } else {
                                    print("Primeiro indice fora de intervalo!")
                                }
                            } else {
                                print("Segunda entrada precisa ser um numero!")
                            }
                        } else {
                            print("Primeira entrada precisa ser um numero!")
                        }
                    } else {
                        print("Muito poucos itens para mudar de ordem...")
                    }
                // ENCERRAR PROGRAMA
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

} while opcao < 0 || opcao > 5 // O loop continua enquanto a opcao for inválida
