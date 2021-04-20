class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '書籍' },
    { id: 3, name: '服' },
    { id: 4, name: '装飾品' },
    { id: 5, name: '雑貨' },
    { id: 6, name: 'レジャー' },
    { id: 7, name: 'エンタメ' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
  end