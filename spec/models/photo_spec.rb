require 'rails_helper'
describe Photo do
  describe '#create' do
    it "(1)画像がなければ登録できない" do
      photo = Photo.new(name:"", product_id: "1")
      photo.valid?
      expect(photo.errors[:name]).to include("を入力してください")
    end
  end
end