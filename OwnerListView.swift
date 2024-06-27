import SwiftUI
import CoreData

struct OwnerListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: OwnerViewModel

    init(viewContext: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: OwnerViewModel(viewContext: viewContext))
    }

    var body: some View {
        List {
            ForEach(viewModel.owners) { owner in
                VStack(alignment: .leading) {
                    Text(owner.name ?? "")
                    Text(owner.contactInfo ?? "").font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Owners")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addOwner) {
                    Label("Add Owner", systemImage: "plus")
                }
            }
        }
    }

    private func addOwner() {
        viewModel.addOwner(name: "New Owner", contactInfo: "New Contact Info")
    }
}

struct OwnerListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        OwnerListView(viewContext: context)
            .environment(\.managedObjectContext, context)
    }
}
