import SwiftUI
import CoreData

struct PaymentListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: PaymentViewModel

    init(viewContext: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: PaymentViewModel(viewContext: viewContext))
    }

    var body: some View {
        List {
            ForEach(viewModel.payments) { payment in
                VStack(alignment: .leading) {
                    Text("Amount: \(payment.amount)")
                    Text("Date: \(payment.date ?? Date())").font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Payments")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addPayment) {
                    Label("Add Payment", systemImage: "plus")
                }
            }
        }
    }

    private func addPayment() {
        viewModel.addPayment(amount: 0.0, date: Date())
    }
}

struct PaymentListView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        PaymentListView(viewContext: context)
            .environment(\.managedObjectContext, context)
    }
}
