//
//  TimelineViewController.swift
//  fakestagram
//
//  Created by LuisE on 3/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var postsCollectionView: UICollectionView!
    let client = TimeLineClient()
    var post: [Post] = [] {
        didSet { updateCollection()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //postsCollectionView.register(UICollectionViewCell.self(<#T##NSObject#>), forCellWithReuseIdentifier: <#T##String#>)
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        
        client.show { [weak self] data in
            self?.post = data
        }
        print(Secrets.uuid.value)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func updateCollection () {
        print ("======", post.count, "=======")
        print (post[1])
        print (post[2])
        print ("Autor: ", post[0].author?.name)
        print ("Likes Count: " ,post[0].likesCount)
        print ("CreatAt: ", post[0].createdAt)
        print ("=============")
    }
}


extension TimelineViewController :  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postViewCell", for: indexPath) as! PostCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}
