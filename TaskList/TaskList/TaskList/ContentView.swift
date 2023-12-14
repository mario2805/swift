//
//  ContentView.swift
//  TaskList
//
//  Created by User on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo: String = ""
    
    var searchBar: some View {
        HStack {
            TextField("Nova tarefa", text: self.$newToDo)
            Button(action: self.addTask, label: {
                Text("+")
            })
        }
    }
    
    func completeTask(_ task: Task) {
        if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
            taskStore.tasks[index].completed.toggle()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks) { task in
                        HStack {
                            Button(action: {
                                self.completeTask(task)
                            }) {
                                if task.completed {
                                    Image(systemName: "checkmark.square")
                                } else {
                                    Image(systemName: "square")
                                }
                            }
                            Text(task.toDo)
                                .strikethrough(task.completed)
                        }
                    }
                    .onMove(perform: self.moveTask)
                    .onDelete(perform: self.deleteTask)
                }
                .navigationBarTitle("Tarefas")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func moveTask(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func deleteTask(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    func addTask() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDo: newToDo, completed: false))
        self.newToDo = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// cheguei atrasado então contei com a ajuda do canal do youtube Archetapp e do ChatGPT
