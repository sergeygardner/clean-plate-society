//
//  AwardEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.04.2026.
//

import Foundation

enum AwardEnum: String, CaseIterable, Hashable, Codable, Equatable {
  case level1 = "Level 1"
  case level2 = "Level 2"
  case level3 = "Level 3"
  case level4 = "Level 4"
  case level5 = "Level 5"
  case level6 = "Level 6"
  case level7 = "Level 7"
  case level8 = "Level 8"
  case level9 = "Level 9"
  case level10 = "Level 10"
  case level11 = "Level 11"
  case level12 = "Level 12"
  case level13 = "Level 13"
  case level14 = "Level 14"
  case level15 = "Level 15"
  case level16 = "Level 16"
  case level17 = "Level 17"
  case level18 = "Level 18"
  case level19 = "Level 19"
  case level20 = "Level 20"
  case level21 = "Level 21"
  case level22 = "Level 22"
  case level23 = "Level 23"
  case level24 = "Level 24"
  case level25 = "Level 25"
  case level26 = "Level 26"
  case level27 = "Level 27"
  case level28 = "Level 28"
  case level29 = "Level 29"
  case level30 = "Level 30"
  case level31 = "Level 31"
  case level32 = "Level 32"
  case level33 = "Level 33"
  case level34 = "Level 34"
  case level35 = "Level 35"
  case level36 = "Level 36"
  case level37 = "Level 37"
  case level38 = "Level 38"
  case level39 = "Level 39"
  case level40 = "Level 40"
  case level41 = "Level 41"
  case level42 = "Level 42"
  case level43 = "Level 43"
  case level44 = "Level 44"
  case level45 = "Level 45"
  case level46 = "Level 46"
  case level47 = "Level 47"
  case level48 = "Level 48"
  case level49 = "Level 49"
  case level50 = "Level 50"
  case level51 = "Level 51"

  var requirement: Int {
    switch self {
    case .level1: return 1
    case .level2: return 3
    case .level3: return 6
    case .level4: return 10
    case .level5: return 15
    case .level6: return 21
    case .level7: return 28
    case .level8: return 36
    case .level9: return 45
    case .level10: return 55
    case .level11: return 66
    case .level12: return 78
    case .level13: return 91
    case .level14: return 105
    case .level15: return 120
    case .level16: return 136
    case .level17: return 153
    case .level18: return 171
    case .level19: return 190
    case .level20: return 210
    case .level21: return 231
    case .level22: return 253
    case .level23: return 276
    case .level24: return 300
    case .level25: return 325
    case .level26: return 351
    case .level27: return 378
    case .level28: return 406
    case .level29: return 435
    case .level30: return 465
    case .level31: return 496
    case .level32: return 528
    case .level33: return 561
    case .level34: return 595
    case .level35: return 630
    case .level36: return 666
    case .level37: return 703
    case .level38: return 741
    case .level39: return 780
    case .level40: return 820
    case .level41: return 861
    case .level42: return 903
    case .level43: return 946
    case .level44: return 990
    case .level45: return 1035
    case .level46: return 1081
    case .level47: return 1128
    case .level48: return 1176
    case .level49: return 1225
    case .level50: return 1275
    case .level51: return 1326
    }
  }

  var name: String {
    return String(describing: self)
  }

  var section: String {
    switch self {
    case .level1, .level2, .level3, .level4, .level5:
      return "foundations"
    case .level6, .level7, .level8, .level9, .level10:
      return "seasonal.salutes"
    case .level11, .level12, .level13, .level14, .level15:
      return "chef.s.compliments"
    case .level16, .level17, .level18, .level19, .level20:
      return "zero.waste.warriors"
    case .level21, .level22, .level23, .level24, .level25:
      return "technical.titans"
    case .level26, .level27, .level28, .level29, .level30:
      return "banquet.bravery"
    case .level31, .level32, .level33, .level34, .level35:
      return "eco.ethics"
    case .level36, .level37, .level38, .level39, .level40:
      return "kitchen.lore"
    case .level41, .level42, .level43, .level44, .level45:
      return "vessel.veneration"
    case .level46, .level47, .level48, .level49, .level50, .level51:
      return "the.great.beyond"

    }
  }

  var tags: [String] {
    switch self {
    case .level1: return ["welcome", "pride", "purpose"]
    case .level2: return ["focus", "diligence", "grit"]
    case .level3: return ["shine", "reflect", "gleam"]
    case .level4: return ["search", "find", "finish"]
    case .level5: return ["loyalty", "habit", "bond"]
    case .level6: return ["seed", "soil", "rain"]
    case .level7: return ["earth", "root", "stem"]
    case .level8: return ["growth", "potential", "bounty"]
    case .level9: return ["water", "pure", "flow"]
    case .level10: return ["light", "energy", "warmth"]
    case .level11: return ["stove", "knife", "heat"]
    case .level12: return ["fire", "iron", "cast"]
    case .level13: return ["edge", "precision", "slice"]
    case .level14: return ["sizzle", "char", "smoke"]
    case .level15: return ["spice", "zest", "aroma"]
    case .level16: return ["planet", "future", "green"]
    case .level17: return ["ecology", "balance", "cycle"]
    case .level18: return ["utility", "value", "saving"]
    case .level19: return ["sphere", "health", "care"]
    case .level20: return ["legacy", "path", "vision"]
    case .level21: return ["technique", "polish", "sweep"]
    case .level22: return ["absorb", "wick", "clean"]
    case .level23: return ["motion", "curve", "flow"]
    case .level24: return ["friction", "sheen", "bright"]
    case .level25: return ["leader", "order", "done"]
    case .level26: return ["mass", "scale", "volume"]
    case .level27: return ["explore", "variety", "all"]
    case .level28: return ["strategy", "pace", "win"]
    case .level29: return ["authority", "taste", "command"]
    case .level30: return ["wisdom", "deep", "full"]
    case .level31: return ["extreme", "pure", "void"]
    case .level32: return ["high", "rank", "pure"]
    case .level33: return ["service", "ethic", "standard"]
    case .level34: return ["message", "land", "care"]
    case .level35: return ["grace", "dignity", "earth"]
    case .level36: return ["legend", "heirloom", "pot"]
    case .level37: return ["surface", "sizzle", "steel"]
    case .level38: return ["roast", "bake", "wait"]
    case .level39: return ["shield", "savour", "scrape"]
    case .level40: return ["choice", "control", "limit"]
    case .level41: return ["royal", "fine", "clear"]
    case .level42: return ["clay", "fire", "vessel"]
    case .level43: return ["glass", "smooth", "hard"]
    case .level44: return ["armor", "white", "clean"]
    case .level45: return ["heat", "form", "stone"]
    case .level46: return ["endless", "deep", "space"]
    case .level47: return ["always", "ever", "meal"]
    case .level48: return ["omega", "last", "closing"]
    case .level49: return ["forgive", "free", "clear"]
    case .level50: return ["crown", "rule", "void"]
    case .level51: return ["supreme", "absolute", "eternal"]
    }
  }
}
