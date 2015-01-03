//
//  CollectionViewController.swift
//  emoji!
//
//  Created by tsunghao on 2015/1/3.
//  Copyright (c) 2015年 MistyDay. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource,  UICollectionViewDelegate {
    
    var emojiList: [[String]] = []
    var sectionTitle: [String] = []
    var currentEmoji: String = "😄"

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initEmojiArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.emojiList.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.emojiList[section].count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as EmojiCell
        cell.cellLabel.text = emojiList[indexPath.section][indexPath.row]
        for c in emojiList[indexPath.section][indexPath.row].unicodeScalars {
            cell.valueLabel.text = NSString(format: "0x%2X", c.value)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let supplementaryViewCell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Header", forIndexPath: indexPath) as HeaderReusableView
                supplementaryViewCell.headerLabel.text = sectionTitle[indexPath.section]
                supplementaryViewCell.headerLabel.textColor = UIColor.whiteColor()
                supplementaryViewCell.backgroundColor = UIColor.darkGrayColor()
                return supplementaryViewCell
        } else {
            let supplementaryViewCell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Footer", forIndexPath: indexPath) as FooterReusableView
            
            if currentEmoji.isEmpty {
                supplementaryViewCell.footerLabel.text = ""
            } else {
                // Get emoji description from emoji self
                let cfstr = NSMutableString(string: currentEmoji) as CFMutableString
                var range = CFRangeMake(0, CFStringGetLength(cfstr))
                CFStringTransform(cfstr, &range, kCFStringTransformToUnicodeName, 0)
                
                // For example \N{FROG FACE}
                var str = String(cfstr)
                // Remove first three character \N{ and last character }
                str = str.substringWithRange(Range<String.Index>(start: advance(str.startIndex,3), end: advance(str.endIndex, -1)))
                
                // Get first character and rest of string
                let strArray = str.componentsSeparatedByString(" ")
                
                // Convert string to titleCase
                str = ""
                for unit in strArray {
                    str += (unit.capitalizedString + " ")
                }
                supplementaryViewCell.footerLabel.text = str
            }
            supplementaryViewCell.footerLabel.textColor = UIColor.blackColor()
            supplementaryViewCell.backgroundColor = UIColor.whiteColor()
            return supplementaryViewCell
        }
    }

    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        currentEmoji = emojiList[indexPath.section][indexPath.row]
        self.collectionView.reloadData()
    }
    
    // MARK: - Helper function
    func initEmojiArray() {

        var array: [String] = []
        
//      Emoji Site:  http://apps.timwhitlock.info/emoji/tables/unicode
        
        // Emoticons ( 1F601 - 1F64F )
        sectionTitle.append("Emoticons")
        for c in 0x1F601...0x1F64F {
            array.append(String(UnicodeScalar(c)))
        }
        emojiList.append(array)

        // Dingbats ( 2702 - 27B0 )
        sectionTitle.append("Dingbats")
        array.removeAll(keepCapacity: true)
        for c in 0x2702...0x27B0 {
            array.append(String(UnicodeScalar(c)))
        }
        emojiList.append(array)
        
        // Transport and map symbols ( 1F680 - 1F6C0 )
        array.removeAll(keepCapacity: true)
        sectionTitle.append("Transport and map symbols")
        for c in 0x1F680...0x1F6C0 {
            array.append(String(UnicodeScalar(c)))
        }
        emojiList.append(array)
        
        // Enclosed characters ( 24C2 - 1F251 )
        array.removeAll(keepCapacity: true)
        array.append(String(UnicodeScalar(0x24c2)))
        sectionTitle.append("Enclosed characters")
        for c in 0x1F170...0x1F251 {
            array.append(String(UnicodeScalar(c)))
        }
        emojiList.append(array)
        // Add Uncategorized
        //        for c in 0x24C2...0x1F251 {
        //            emojiList.append(String(UnicodeScalar(c)))
        //        }
        
        // Additional emoticons ( 1F600 - 1F636 )
        array.removeAll(keepCapacity: true)
        sectionTitle.append("Additional emoticons")
        for c in 0x1F600...0x1F636 {
            array.append(String(UnicodeScalar(c)))
        }
        emojiList.append(array)
        
        // Additional transport and map symbols ( 1F681 - 1F6C5 )
        array.removeAll(keepCapacity: true)
        sectionTitle.append("Additional transport and map symbols")
        for c in 0x1F681...0x1F6C5 {
            array.append(String(UnicodeScalar(c)))
        }
        emojiList.append(array)
        
        // Other additional symbols ( 1F30D - 1F567 )
        array.removeAll(keepCapacity: true)
        sectionTitle.append("Other additional symbols")
        for c in 0x1F30D...0x1F567 {
            array.append(String(UnicodeScalar(c)))
        }
        emojiList.append(array)
    }
}

