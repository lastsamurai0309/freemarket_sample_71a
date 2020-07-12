require 'rails_helper'

describe Product do
  describe '#create' do
    it "(1)nameがない場合は登録できないこと" do
      product = Product.new(name:"", content: "美味しい", category_id: "1", brand: "ドール", condition_id: "1", fee_id: "1", area_id: "1", shippingday_id: "1", price: "1000", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "(2)contentがない場合は登録できないこと" do
      product = Product.new(name:"バナナ", content: "", category_id: "1", brand: "ドール", condition_id: "1", fee_id: "1", area_id: "1", shippingday_id: "1", price: "1000", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:content]).to include("を入力してください")
    end

    it "(3)category_idがない場合は登録できないこと" do
      product = Product.new(name:"バナナ", content: "美味しい", category_id: "", brand: "ドール", condition_id: "1", fee_id: "1", area_id: "1", shippingday_id: "1", price: "1000", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "(4)condition_idがない場合は登録できないこと" do
      product = Product.new(name:"バナナ", content: "美味しい", category_id: "1", brand: "ドール", condition_id: "", fee_id: "1", area_id: "1", shippingday_id: "1", price: "1000", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end

    it "(5)fee_idがない場合は登録できないこと" do
      product = Product.new(name:"バナナ", content: "美味しい", category_id: "1", brand: "ドール", condition_id: "1", fee_id: "", area_id: "1", shippingday_id: "1", price: "1000", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:fee_id]).to include("を入力してください")
    end

    it "(6)area_idがない場合は登録できないこと" do
      product = Product.new(name:"バナナ", content: "美味しい", category_id: "1", brand: "ドール", condition_id: "1", fee_id: "1", area_id: "", shippingday_id: "1", price: "1000", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:area_id]).to include("を入力してください")
    end

    it "(7)shippingday_idがない場合は登録できないこと" do
      product = Product.new(name:"バナナ", content: "美味しい", category_id: "1", brand: "ドール", condition_id: "1", fee_id: "1", area_id: "1", shippingday_id: "", price: "1000", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:shippingday_id]).to include("を入力してください")
    end

    it "(8)priceがない場合は登録できないこと" do
      product = Product.new(name:"バナナ", content: "美味しい", category_id: "1", brand: "ドール", condition_id: "1", fee_id: "1", area_id: "1", shippingday_id: "1", price: "", status: "0", user_id: "1")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
  end
end