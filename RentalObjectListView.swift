import SwiftUI
import CoreData

struct RentalObjectListView: View {
    @ObservedObject private var viewModel: RentalObjectViewModel

    init(viewContext: NSManagedObjectContext) {
        _viewModel = ObservedObject(wrappedValue: RentalObjectViewModel(context: viewContext))
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.rentalObjects) { rentalObject in
                        VStack(alignment: .leading) {
                            Text(rentalObject.name ?? "")
                            Text(rentalObject.type ?? "").font(.subheadline).foregroundColor(.gray)
                            Text(rentalObject.location ?? "").font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("Rental Objects")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.name = ""
                            viewModel.type = ""
                            viewModel.location = ""
                        }) {
                            Label("Clear Form", systemImage: "xmark.circle")
                        }
                    }
                }

                Form {
                    Section(header: Text("Add Rental Object")) {
                        TextField("Name", text: $viewModel.name)
                        TextField("Type", text: $viewModel.type)
                        TextField("Location", text: $viewModel.location)
                        Button("Save") {
                            viewModel.saveRentalObject()
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct RentalObjectListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        RentalObjectListView(viewContext: context)
            .environment(\.managedObjectContext, context)
    }
}
