// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

// swiftlint:disable file_length
// swiftlint:disable type_body_length

struct StoryboardScene {
  enum MainStoryboard: String, StoryboardSceneType {
    static let storyboardName = "MainStoryboard"

    case MapVCScene = "MapVC"
    static func instantiateMapVC() -> MapViewController {
      guard let vc = StoryboardScene.MainStoryboard.MapVCScene.viewController() as? MapViewController
      else {
        fatalError("ViewController 'MapVC' is not of the expected class MapViewController.")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}
