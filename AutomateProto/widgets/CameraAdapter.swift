//
//  CameraAdapter.swift
//  AutomateProto
//
//  Created by Talha Ghous on 23/10/2018.
//  Copyright © 2018 Automate Inc. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraAdapter: NSObject {

    private let imagePicker = UIImagePickerController();
    private let isPhotoLibraryAvailable = UIImagePickerController.isSourceTypeAvailable(.photoLibrary);
    private let isSavedPhotoAlbumAvailable = UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum);
    private let isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.camera);
    private let isRearCameraAvailable = UIImagePickerController.isCameraDeviceAvailable(.rear);
    private let isFrontCameraAvailable = UIImagePickerController.isCameraDeviceAvailable(.front);
    private let sourceTypeCamera = UIImagePickerController.SourceType.camera;
    private let rearCamera = UIImagePickerController.CameraDevice.rear;
    private let frontCamera = UIImagePickerController.CameraDevice.front;
    
    var delegate: UINavigationControllerDelegate & UIImagePickerControllerDelegate;
    
    init(delegate_: UINavigationControllerDelegate & UIImagePickerControllerDelegate) {
        delegate = delegate_;
    }
    
    func getPhotoLibrary(_ onVC: UIViewController, canEdit: Bool) {
        if !isPhotoLibraryAvailable && !isSavedPhotoAlbumAvailable {
            return;
        }
        let type = kUTTypeImage as String;
        
        if (isPhotoLibraryAvailable) {
            imagePicker.sourceType = .photoLibrary;
            if let availableTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) {
                if (availableTypes.contains(type)) {
                    imagePicker.mediaTypes = [type];
                    imagePicker.allowsEditing = canEdit;
                }
            }
            
            imagePicker.sourceType = .savedPhotosAlbum;
            if let availableTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum) {
                if (availableTypes.contains(type)) {
                    imagePicker.mediaTypes = [type];
                }
            }
        } else {
            return;
        }
        
        imagePicker.allowsEditing = canEdit;
        imagePicker.delegate = delegate;
        onVC.present(imagePicker, animated: true, completion: nil);
    }
    
    func getCameraOn(_ onVC: UIViewController, canEdit: Bool) {
        if !isCameraAvailable {
            return;
        }
        let type1 = kUTTypeImage as String;
        
        if (isCameraAvailable) {
            if let availableTypes = UIImagePickerController.availableMediaTypes(for: .camera) {
                if (availableTypes.contains(type1)) {
                    imagePicker.mediaTypes = [type1];
                    imagePicker.sourceType = sourceTypeCamera;
                }
            }
            
            if (isRearCameraAvailable) {
                imagePicker.cameraDevice = rearCamera;
            } else if (isFrontCameraAvailable) {
                imagePicker.cameraDevice = frontCamera;
            }
            
        } else {
            return;
        }
        
        imagePicker.allowsEditing = canEdit;
        imagePicker.showsCameraControls = true;
        imagePicker.delegate = delegate;
        onVC.present(imagePicker, animated: true, completion: nil);
    }
    
}/** end class.*/
