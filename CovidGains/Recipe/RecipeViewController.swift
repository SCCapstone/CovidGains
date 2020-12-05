//
//  RecipeViewController.swift
//  CovidGains
//
//  Created by Maitri Patel on 10/25/20.
// Added var image Arr, var ingr and var direct by Nishat Tabassum, 2020

import UIKit

class RecipeViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArr = ["Broccoli Pesto Pasta", "Mashed Potatoes", "Lemon Chicken", "Pasta with Chickpea Sauce", "Mac and Cheese", "Smokey Potatoes", "Greek Spaghetti", "Nutty Rice", "Meatball", "Alfraedo Chicken"]
    
    var ingr = ["Ingredients: \nPasta, \nBroccoli florets, \nBasil leaves, \nGarlic cloves, \nPine nuts, \nVirgin olive oil, \nSalt, \nParmigiano-reggiano.", "Ingredients: \nBaking potatoes, \nMilk, \nButter, \nPepper, \nSalt.", "Ingredients: \nChicken breasts, \nFlour, \nGarlic, \nLemon, \nSalt, \nPepper, \nOregano, \nOlive oil, \nButter, \nChicken broth, \nParsley.", "Ingredients: \nOnion, \nOil, \nCarrot, \nParsley, \nBasil, \nWater.", "Ingredients: \nMacaroni cheese, \nCheddar cheese, \nMilk, \nButter, \nFlour, \nPaprika", "Ingredients: \nPotatoes, \nOil, \nPepper, \nSalt", "\nTomatoes, \nOlives, \nCheese, \nPepper, \nSpaghetti, \nOil", "Ingredients: \nBrown rice, \nNuts, \nButter, \nNutmeg, \nWater", "Ingredients: \nBeef, \nPork, \nCheese, \nOnion, \nGarlic, \nBasil, \nParsley, \nOregano, \nBread crumbs", "Ingredients: \nChicken, \nAlfredo sauce, \nOil, \nHeavy cream, \nNutmeg, \nButter, \nBoneless chicken, \nFettuccine"]
    
    var direct = ["Instructions: \nStep 1: Boil water in a large pot. \nStep 2: Add broccoli with boil water. \nAdd pasta, \nStep 3: In a blender mix all the ingredients along with broccoli, basil, garlic, pinenuts. \nStep 4: Top with Parmigiano-reggiano and chili flakes according to taste. ", "Intructions: \nStep 1: Boil water with salt and add potatoes until it's tender. \nStep 2: In a small saucepan heat butter and milk until butter is melted. \nStep 3: Mash the potatoes, season with salt and pepper. ", "Instructions: \nStep 1: Afte seasoning the chicken, place flour on the both sides of chicken and heat it, Step 2: Add olive oil stir till the chicken is brown. \nStep 3: Saute garlic, lemon juice and simmer with chicken. \nStep 4: Garnish with parsley and serve.", "Instructions: \nStep 1: Heat olive oil, \nStep 2: Add onion, carrot and minced garlic, cook for 8 mins. \nStep 3: Place onion mixture with chickpeas, ater, salt and pepper in a blender. \nStep 4: Toss with hot cooked penne, sprinkle with parsley and basil.", "Instructions: \nStep 1: Cook macaroni, \nStep 2: Mix flour with salt, garlic and melt butter. \nStep 3: Add flour and cook for 1 minute. \nStep 4: Add milk and sour cream and cook with cooked pasta with cheese.", "Instructions: \nStep 1: Boil with potatoes and chop fresh garlic, \nStep 2: Add the olie oil, oregano, basil, salt. \nStep 3: Make the potatoes smokey and add with the other ingredients. \nStep 4: Smoke for 2 hours and add with fresh cheese and parsley. ", "Instructions: \nStep 1: In a bowl combine the tomatoes, olives, feta, salt and pepper. \nStep 2: Cook sphagetti. \nStep 3: In a fry pan heat the olive oil, add garlic and cook. \nStep 4: Add with fresh parsley and serve.", "Instructions: \nStep 1: In a large pan we boil the rice and add soya sauce to boil. \nStep 2: Saute onions with butter and stir with the rest of ingredients. \nStep 3: Drain rice and stir in the onion mixture and serve.", "Instructions: \nStep 1: Mix with bread crumbs and add more milk, \nStep 2: With breadcrumb and mixture add beef, eggs, onions, garlic with salt and pepper. \nStep 3: Shape mixture with greased hands into evensize meatballs. ", "Instructions: \nStep 1: Add pasta and cook it with water an salt. \nStep 2: Slic the chicken into thick strips and season them with salt and pepper. \nStep 3: Heat butter then cook the chicken. \nStep 4:  When the butter is melted, add the cream and nutmeg  to cook for 2 minutes. \nStep 4: Whisk the Parmigiano-Reggiano into the sauce and serve with pasta."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
extension RecipeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath : IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DataCollectionViewCell
        cell?.img.image = UIImage(named: imageArr[indexPath.row])
        cell?.lbl.text = imageArr[indexPath.row]
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController
        vc?.name = imageArr[indexPath.row]
        vc?.ingre = ingr[indexPath.row]
        vc?.st = direct[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
