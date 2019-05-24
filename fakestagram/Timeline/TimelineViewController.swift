//
//  TimelineViewController.swift
//  fakestagram


import UIKit

class TimelineViewController: UIViewController { 
    @IBOutlet weak var postsCollectionView: UICollectionView!
    let client = TimeLineClient()
    var posts: [Post] = [] {
        //didSet { updateCollection()}
        didSet { postsCollectionView.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Secrets.token.value!)
        
        configCollectionView()
        client.show { [weak self] data in
            self?.posts = data
            
        }

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
        print ("======", posts.count, "=======")
        for p in posts {
            print (p)
        }
    }

    
    private func configCollectionView() {
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        let postCollectionViewCellXib = UINib(nibName: String(describing: PostCollectionViewCell.self), bundle: nil)
        
        postsCollectionView.register(postCollectionViewCellXib, forCellWithReuseIdentifier: PostCollectionViewCell.reuseIdentifier)
    }
}

//==============MANEJO DEL COLLECTION VIEW ===========================

extension TimelineViewController :  UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 120, height: 120)
         return CGSize(width: self.postsCollectionView.frame.width, height: 600)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseIdentifier, for: indexPath) as! PostCollectionViewCell
        //cell.backgroundColor = .red
        cell.post = posts[indexPath.row]
        return cell
    }
    
    
}
