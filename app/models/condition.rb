class Condition < ActiveHash::Base
  self.data = [
    {id: 1, name: '新品'},{id: 2, name: '未使用'},{id: 3,name: '目立った傷なし'},{id: 4,name: '傷あり'}
  ]

  include ActiveHash::Associations
  has_many :products 
end