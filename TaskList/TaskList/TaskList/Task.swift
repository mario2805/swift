
import Foundation
import SwiftUI
import Combine


struct Task: Identifiable {
    var id: String
    var toDo: String
    var completed: Bool
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
