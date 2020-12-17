require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it '保存されているユーザーの情報と合致すればログインができる' do
    sign_in(@user)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # トップページに遷移させる
    visit root_path
    # トップページにログインページへ遷移するボタンがあることを確認する
    expect(page).to have_content('ログイン')
    # ログインページへ遷移する
    visit new_user_session_path
    # 誤ったユーザー情報を入力する
    fill_in 'email', with: 'test2'
    fill_in 'password', with: 'test2'
    # ログインボタンをクリックする
    click_on('Log in')
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_user_session_path
  end
end
