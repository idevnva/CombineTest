//
//  ContentView.swift
//  CombineTest
//
//  Created by Vladislav Novoshinskiy on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var vm = ViewModel()
    @State var presentAlert = false
    
    var body: some View {
        Form {
            Section(footer: Text(vm.usernameMessage).foregroundColor(.red)) {
                TextField("Username", text: $vm.username)
                    .autocapitalization(.none)
            }
            Section(footer: Text(vm.passwordMessage).foregroundColor(.red)) {
                SecureField("Password", text: $vm.password)
                SecureField("Password again", text: $vm.passwordAgain)
            }
            Section() {
                Button(action: { self.signUp() }) {
                    Text("Sign up")
                }
                .disabled(!self.vm.isValid)
            }
        }
        .sheet(isPresented: $presentAlert) {
            WelcomeView()
        }
    }
    func signUp() {
        self.presentAlert = true
    }
}

struct WelcomeView: View {
    var body: some View {
        Text("Welcome! Great to have you on board!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
