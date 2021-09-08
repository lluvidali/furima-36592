require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,first_name_kanji,family_name_kanji,first_name_kana,family_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが６文字以上かつ英数混合であれば登録できる' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nickenameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_name_kanji（名前）が空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it 'first_name_kanji（名前）が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid')
      end

      it 'family_name_kanji（名字）が空では登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end

      it 'family_name_kanji（名字）が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kanji is invalid')
      end

      it 'first_name_kana（名前）が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kana（名前）が全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'family_name_kana（名字）が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kana（名字）が全角（カタカナ）でなければ登録できない' do
        @user.family_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'birthday（生年月日）が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'abcde.yahoo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordに半角英数字の両方が含まれていない場合登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが５文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
