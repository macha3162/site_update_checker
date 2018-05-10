class SiteType < ActiveHash::Base
  include ActiveHash::Associations

  has_many :sites

  self.data = [
      {id: 1, name: "法令・規制等"},
      {id: 2, name: "個人情報保護条例"}
  ]
end