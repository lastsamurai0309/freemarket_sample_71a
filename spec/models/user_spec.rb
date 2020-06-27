require 'rails_helper'

describe User do
  describe '#create' do
    
    it "(1) nicknameは必須です。" do
      user = User.new(nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "(2) first_name(名)は必須です。" do
      user = User.new(first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "(3) last_name(姓)は必須です。" do
      user = User.new(last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "(4) first_name_fri(名)は必須です。" do
      user = User.new(first_name_fri: "")
      user.valid?
      expect(user.errors[:first_name_fri]).to include("can't be blank")
    end

    it "(5) last_name_fri(姓)は必須です。" do
      user = User.new(last_name_fri: "")
      user.valid?
      expect(user.errors[:last_name_fri]).to include("can't be blank")
    end

    it "(6) birth_yearは必須です。" do
      user = User.new(birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it "(7) birth_monthは必須です。" do
      user = User.new(birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it "(8) birth_dayは必須です。" do
      user = User.new(birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it "(9) address_nameは必須です。" do
      user = Address.new(address_name: "")
      user.valid?
      expect(user.errors[:address_name]).to include("can't be blank")
    end

    it "(10) address_furiは必須です。" do
      user = Address.new(address_furi: "")
      user.valid?
      expect(user.errors[:address_furi]).to include("can't be blank")
    end

    it "(11) post_numは必須です。" do
      user = Address.new(post_num: "")
      user.valid?
      expect(user.errors[:post_num]).to include("can't be blank")
    end

    it "(12) prefectureは必須です。" do
      user = Address.new(prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("can't be blank")
    end
    it "(13) cityは必須です。" do
      user = Address.new(city: "")
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end
    it "(14) addressは必須です。" do
      user = Address.new(address: "")
      user.valid?
      expect(user.errors[:address]).to include("can't be blank")
    end

    it "(15-1) emailは必須です。" do
      user = User.new(email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "(15-2) @とdomainを含みます" do
      user = User.new(email: "thirdgmail.com")
      user.valid?
      expect(user.errors[:email]).to include ("is invalid")
    end    
    
    it "(16-1) passwordは必須です" do
      user = User.new(password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end    
    
    it "(16-2) passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = User.new(password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "(16-3) passwordが6文字以下なら登録不可" do
      user = User.new(password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

  end
end