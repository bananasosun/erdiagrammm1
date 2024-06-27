import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: EmployeeListView(viewContext: viewContext)) {
                    Text("Employees")
                }
                NavigationLink(destination: ClientListView(viewContext: viewContext)) {
                    Text("Clients")
                }
                NavigationLink(destination: OwnerListView(viewContext: viewContext)) {
                    Text("Owners")
                }
                NavigationLink(destination: PaymentListView(viewContext: viewContext)) {
                    Text("Payments")
                }
                NavigationLink(destination: RentalObjectListView(viewContext: viewContext)) {
                    Text("Rental Objects")
                }
                NavigationLink(destination: RequestListView(viewContext: viewContext)) {
                    Text("Requests")
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
