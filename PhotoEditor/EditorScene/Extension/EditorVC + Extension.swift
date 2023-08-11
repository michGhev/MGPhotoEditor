//
//  EditorVC + Extension.swift
//  PhotoEditor
//
//  Created by Michael Ghevondyan on 10.08.23.
//

import UIKit

extension EditPhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        beginImage = CIImage(image:image)
        orientation = image.imageOrientation
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        self.editorImageView.image = image
        self.editorImageView.isHidden = false
        self.clearButton.isHidden = false
        self.slider.isEnabled = true
    }
}
