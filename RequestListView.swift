import SwiftUI
import CoreData

struct RequestListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: RequestViewModel

    init(viewContext: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: RequestViewModel(viewContext: viewContext))
    }

    var body: some View {
        List {
            ForEach(viewModel.requests) { request in
                VStack(alignment: .leading) {
                    Text(request.requestDescription ?? "")
                    Text("Date: \(request.date ?? Date())").font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Requests")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addRequest) {
                    Label("Add Request", systemImage: "plus")
                }
            }
        }
    }

    private func addRequest() {
        viewModel.addRequest(description: "New Request", date: Date())
    }
}

struct RequestListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        RequestListView(viewContext: context)
            .environment(\.managedObjectContext, context)
    }
}
