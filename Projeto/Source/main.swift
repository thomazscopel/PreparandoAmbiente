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

func adicionarTarefa(lista: [String]) {
    print("Digite sua nova tarefa: ")
    guard let tarefa = readLine() else {
        return
    }
    lista.append(tarefa)
}

func removerTarefa(lista: [String]) {
    
    let indice: Int = -1
    
    repeat {
        // To Do: chamar funcao de mostrar tarefas aqui
        print("Digite o número da tarefa que deseja remover: ", terminator: "")
        guard let input = readLine() else {
            return
        }
        
        if let numIndice = Int(input) {
            indice = numIndice
            
            // Se o indice esta dentro do intervalo de itens da lista
            if indice > -1 && indice < lista.count {
                lista.remove(at:indice)
                print("Tarefa removida com sucesso!!")
                return
            }
            
            print("Opção Inválida! Deve estar no intervalo de itens!")
        } else {
            print("Entrada inválida! Por favor, digite um número.")
            indice = -1
        }
    } while indice < 0 && indice > lista.count
    
}

var opcao: Int = 0 

// Loop para verificar uma entrada válida
repeat {
    showMenu()
    guard let input = readLine() else {
        exit(0) 
    }

    if let numOpcao = Int(input) {
        // Atribui o valor lido a 'opcao' se for um número válido
        opcao = numOpcao
        
        if opcao < 1 || opcao > 5 {
            print("Opção Inválida! Deve inserir um número entre 1 e 5.")
        }
    } else {
        // Se a entrada não for um número, imprime erro e mantém 'opcao' inválida
        print("Entrada inválida! Por favor, digite um número.")
        opcao = 0 
    }

} while opcao < 1 || opcao > 5 // O loop continua enquanto a opcao for inválida





