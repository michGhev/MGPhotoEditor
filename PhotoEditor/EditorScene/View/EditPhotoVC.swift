//
//  ViewController.swift
//  PhotoEditor
//
//  Created by Michael Ghevondyan on 10.08.23.
//

import UIKit

class EditPhotoVC: UIViewController {
    
    // MARK: Properties
    
    var imagePicker = UIImagePickerController()
    var context: CIContext! = CIContext(options:nil)
    var filter: CIFilter = CIFilter(name: FilterModel.cISepiaTone.rawValue)!
    var orientation: UIImage.Orientation = .up
    var beginImage: CIImage!
    
    // MARK: IBOutlets
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var editorImageView: UIImageView!
    @IBOutlet weak var clearButton: UIButton!

    
    
    // MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    // MARK: @IBActions
    
    @IBAction func createPhotoButtonAction(_ sender: UIButton) {
        self.openGallery()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        self.sliderValueLabel.text = String(format: "%0.2f", sender.value)
        let sliderValue = sender.value
        self.filter.setValue(sliderValue, forKey: kCIInputIntensityKey)
        guard  let outputImage = self.filter.outputImage else { return }
        guard  let cgimg = self.context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let newImage = UIImage(cgImage: cgimg, scale:1, orientation:orientation)
        self.editorImageView.image = newImage
    }
    
    @IBAction func imageClearButtonAction(_ sender: UIButton) {
        self.editorImageView.image = UIImage()
        self.editorImageView.isHidden = true
        self.clearButton.isHidden = true
        self.slider.isEnabled = false
        self.slider.value = 0.0
        self.sliderValueLabel.text = String(format: "%0.2f", slider.value)
    }
    
    
    
    // MARK: Private functions
    
    private func openGallery(){
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
}
