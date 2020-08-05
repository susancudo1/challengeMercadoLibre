//
//  ListView.swift
//  MercadoLibreApp
//
//  Created by Javier Susa on 4/08/20.
//  Copyright © 2020 Javier Susa. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    var searchText: String
    var viewModel = ListViewModel()
    @State private var titleAlert = ""
    @State private var messageAlert = ""
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlertView = false
    @State private var arrayPorducts = [Product]()
    @State var selectedProduct: Product?
    @State var showModalView = false
    
    
    var body: some View {
        VStack {
            ZStack {
                List(arrayPorducts, id: \.id) { product in
                    CellView(product: product)
                        .onTapGesture {
                            self.selectedProduct = product
                            self.showModalView.toggle()
                    }
                }
                .sheet(isPresented: $showModalView) {
                    if self.selectedProduct != nil {
                        DetailsView(product: self.selectedProduct!)
                    }
                }
                .navigationBarTitle(searchText)
                .onAppear {
                    //Validacion de conexion a internet
                    guard CheckInternet.connection() else {
                        self.titleAlert = "Sin Internet"
                        self.messageAlert = "Actualmente no cuentas con conexión a internet"
                        self.showAlertView.toggle()
                        return
                    }
                    //Inicia la busqueda en mercadolibre
                    self.viewModel.search(searchText: self.searchText) { (products) in
                        if products == nil {
                            self.titleAlert = "No hay coincidencias"
                            self.messageAlert = "No se encontraron coincidencias para tu búsqueda, por favor intenta de nuevo"
                            self.showAlertView.toggle()
                        } else {
                            self.arrayPorducts = products!
                        }
                        
                    }
                }
                .alert(isPresented: $showAlertView) {
                    Alert(title: Text(self.titleAlert),
                          message: Text(self.messageAlert),
                          dismissButton: .default(Text("OK"), action: {
                            self.presentationMode.wrappedValue.dismiss()
                          }))
                }
                .opacity(self.arrayPorducts.isEmpty ? 0.0 : 1.0)
                
                LoadingView()
                    .opacity(self.arrayPorducts.isEmpty ? 1.0 : 0.0)
            }
        }
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(searchText: "Motorola G6")
        }
    }
    
    struct CellView: View {
        
        var product: Product
        
        var body: some View {
            HStack {
                if product.imageData != nil {
                    Image(uiImage: UIImage(data: product.imageData!)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100)
                } else {
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100)
                }
                
                VStack(alignment: .leading) {
                    Text("\(product.title)")
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text("$\(Int(product.price))")
                    .font(.system(.body, design: .rounded))
                        .padding(.top)
                }
                
            }
        }
    }
}
