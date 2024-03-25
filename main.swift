import AppKit
import ScriptingBridge

@objc public protocol FinderApplication {
    @objc optional func FinderWindows() -> SBElementArray
    @objc optional var selection: SBObject { get } // the selection in the frontmost Finder window
}
extension SBApplication: FinderApplication {}

@objc public protocol FinderItem {
    @objc optional var URL: String { get } // the URL of the item
}
extension SBObject: FinderItem {}

@objc public protocol FinderFinderWindow {
    @objc optional var target: SBObject { get } // the container at which this file viewer is targeted
}
extension SBObject: FinderFinderWindow {}

var finder = SBApplication(bundleIdentifier: "com.apple.Finder")! as FinderApplication

var selected = finder.selection?.get() as! Array<FinderItem>
var focusedWindow = finder.FinderWindows?().firstObject as! FinderFinderWindow?

var url: URL?;

if selected.count > 0 {
	url = URL(string: selected[0].URL!);
} else if focusedWindow != nil {
	url = URL(string: (focusedWindow!.target! as FinderItem).URL!)
}

let whatToOpen = Bundle.main.infoDictionary?["OpenBundleID"] as! String;

if url != nil {

    let openProc = Process()

    openProc.executableURL = URL(string: "file:///usr/bin/open")
    openProc.arguments = ["-b", whatToOpen, url?.path as! String];
    try openProc.run()
}
