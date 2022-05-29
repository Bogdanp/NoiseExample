//
//  NoiseExampleApp.swift
//  NoiseExample
//
//  Created by Bogdan Popa on 29.05.2022.
//

import Noise
import SwiftUI

@main
struct NoiseExampleApp: App {
  var r: Racket!
  var s: String!

  init() {
    r = Racket()
    r.bracket {
      r.load(zo: Bundle.main.url(forResource: "resources/example", withExtension: "zo")!)
      let mod = Val.cons(Val.symbol("quote"), Val.cons(Val.symbol("example"), Val.null))
      let getter = r.require(Val.symbol("get-text"), from: mod).car()!
      s = getter.apply(Val.null)!.car()!.bytestring()!
    }
  }

  var body: some Scene {
    WindowGroup {
      ContentView(text: s)
    }
  }
}
