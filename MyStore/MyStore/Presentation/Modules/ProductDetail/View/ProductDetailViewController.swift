//
//  ProductDetailViewController.swift
//  MyStore
//
//  Created by Andrey Carreño on 21/02/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var contentTable: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var table: UITableView!
    
    //in this enumerator find all .xibs names
    enum NibIds: String {
        case productPrice = "ProductPrice"
        case attributeProductCell = "AttributeProductCell"
        case productImage = "ProductImage"
        case productSectionTitle = "ProductSectionTitle"
    }
    
    var presenter: ViewToPresenterProductDetailProtocol?
    var product: Product?
    var container: [ProductDetailCellModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFunctions()
    }
    /**
     this function execute all initial methods
     */
    func initFunctions() {
        inflateTable()
        registerCells()
        getProduct()
    }
    
    func inflateTable() {
        presenter?.getRowsTable()
    }
    
    func getProduct() {
        presenter?.getProductDetail()
    }
    
    /**
     here registers all Nibs before use in the table
     */
    func registerCells() {
        let nibProductPrice = UINib(nibName: NibIds.productPrice.rawValue, bundle: nil)
        let nibProductAttr = UINib(nibName: NibIds.attributeProductCell.rawValue, bundle: nil)
        let nibProductImg = UINib(nibName: NibIds.productImage.rawValue, bundle: nil)
        let nibProductSectionTitle = UINib(nibName: NibIds.productSectionTitle.rawValue, bundle: nil)
        
        table.register(nibProductPrice, forCellReuseIdentifier:  NibIds.productPrice.rawValue)
        table.register(nibProductAttr, forCellReuseIdentifier: NibIds.attributeProductCell.rawValue)
        table.register(nibProductImg, forCellReuseIdentifier: NibIds.productImage.rawValue)
        table.register(nibProductSectionTitle, forCellReuseIdentifier: NibIds.productSectionTitle.rawValue)
        
    }
}
extension ProductDetailViewController: PresenterToViewProductDetailProtocol{
    
    func getDataTable(container: [ProductDetailCellModel]) {
        self.container = container
    }
    
    
    func getProduct(product: Product?) {
        self.product = product
        
    }
    
}

extension ProductDetailViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = container[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId.rawValue, for: indexPath) as! ProductDetailTableViewCell
        cell.setTup(item: item)
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return container.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let item = container[indexPath.row]
        return CGFloat(item.height)
        
    }
    
}

