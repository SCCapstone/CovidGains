import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var titelLabel: UILabel!

    @IBOutlet weak var noteLabel: UITextView!
    public var noteTitle: String = ""
    public var note: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        titelLabel.text = noteTitle //
        noteLabel.text = note //
    }

}
