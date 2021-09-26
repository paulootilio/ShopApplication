




Store.create(name: 'Autorizada Apple X', address: "Shopping center em Teresina, Piauí")
Store.create(name: 'Autorizada Apple Y', address: "Shopping center em Fortaleza, Ceará")
Store.create(name: 'Autorizada Apple Z', address: "Shopping center em Gramado, Rio Grande do Sul")
Store.create(name: 'Autorizada Apple W', address: "Shopping center em Guarulhos, São Paulo")
    
Product.create(name: 'iPhone 13 Pro Max', description: "128 GB lançado no dia 14 de Setembro de 2021", price: 10499.00)
Product.create(name: 'iPhone 12 Pro Max', description: "256 GB lançado no dia 14 de Setembro de 2021", price: 7899.00)
Product.create(name: 'iPhone 12', description: "256 GB lançado no dia 14 de Setembro de 2021", price: 6899.00)
Product.create(name: 'iPhone 12 Pro', description: "256 GB lançado no dia 14 de Setembro de 2021", price: 7399.00)
Product.create(name: 'iPhone 11 Pro Max', description: "256 GB lançado no dia 14 de Setembro de 2021", price: 4499.00)
Product.create(name: 'iPhone 13 Pro', description: "256 GB lançado no dia 14 de Setembro de 2021", price: 9499.00)

StockItem.create(store_id: 2, product_id: 1, stock: 25)    
StockItem.create(store_id: 3, product_id: 3, stock: 15)    
StockItem.create(store_id: 1, product_id: 2, stock: 29)    