import SwiftUI
import CoreData

struct EmployeeListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: EmployeeViewModel

    init(viewContext: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: EmployeeViewModel(viewContext: viewContext))
    }

    var body: some View {
        List {
            ForEach(viewModel.employees) { employee in
                VStack(alignment: .leading) {
                    Text(employee.name ?? "")
                    Text(employee.position ?? "").font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Employees")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addEmployee) {
                    Label("Add Employee", systemImage: "plus")
                }
            }
        }
    }

    private func addEmployee() {
        viewModel.addEmployee(name: "New Employee", position: "New Position")
    }
}
struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        EmployeeListView(viewContext: context)
            .environment(\.managedObjectContext, context)
    }
}
