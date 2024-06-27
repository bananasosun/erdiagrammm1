import SwiftUI
import CoreData

struct ClientListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: ClientViewModel

    init(viewContext: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: ClientViewModel(viewContext: viewContext))
    }

    var body: some View {
        List {
            ForEach(viewModel.clients) { client in
                VStack(alignment: .leading) {
                    Text(client.name ?? "")
                    Text(client.contactInfo ?? "").font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Clients")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addClient) {
                    Label("Add Client", systemImage: "plus")
                }
            }
        }
    }

    private func addClient() {
        viewModel.addClient(name: "New Client", contactInfo: "New Contact Info")
    }
}

struct ClientListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        ClientListView(viewContext: context)
            .environment(\.managedObjectContext, context)
    }
}
