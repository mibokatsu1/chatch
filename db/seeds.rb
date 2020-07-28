# # ユーザー登録
users = User.create!([
  {name: "guest", email: "guest@mail.com",password:"guest000"},
  {name: "tanaka", email: "tanaka@mail.com",password:"tanaka00",image:File.open('./app/assets/images/user2.jpg')},
  {name: "suzuki", email: "suzuki@mail.com",password:"suzuki00",image:File.open('./app/assets/images/user3.jpg')},
  {name: "yamada", email: "yamada@mail.com",password:"yamada00",image:File.open('./app/assets/images/user4.jpg')},
  {name: "nishikawa", email: "nishikawa@mail.com",password:"nishikawa00",image:File.open('./app/assets/images/user5.jpg')},
  {name: "okukawa", email: "okukawa@mail.com",password:"okukawa00",image:File.open('./app/assets/images/user6.jpg')}
 ])

# ユーザーアバター用画像
# users = User.create!([
#   {user: 2, image:File.open('./app/assets/images/user2.jpg',)},
#   {user: 3, image:File.open('./app/assets/images/user3.jpg',)},
#   {user: 4, image:File.open('./app/assets/images/user4.jpg',)},
#   {user: 5, image:File.open('./app/assets/images/user5.jpg',)},
#   {user: 6, image:File.open('./app/assets/images/user6.jpg',)}
#  ])


# トップページ一覧表示用アイテム
all_users_chats = AllUsersChat.create!([
  {
  name: "グルメについて語りましょう",
  user_id: 2,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_01.png'),
  },
  {
  name: "家電マニア",
  user_id: 2,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_02.png'),
  },
  {
  name: "綺麗な風景",
  user_id: 3,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_03.jpg'),
  },
  {
  name: "野球同好会",
  user_id: 3,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_04.jpg'),
  },
  {
  name: "テニスが好きだ",
  user_id: 4,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_05.jpg'),
  },
  {
  name: "ランナーズ",
  user_id: 4,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_06.jpg'),
  },
  {
  name: "海の世界",
  user_id: 5,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_07.jpg'),
  },
  {
  name: "エレベーター＆エスカレーター",
  user_id: 5,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_08.jpg'),
  },
  {
  name: "猫を愛でる",
  user_id: 6,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_09.jpg'),
  },
  {
  name: "電車マニア",
  user_id: 1,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_10.jpg')
  }
])


 # all_users_chat1の初期コメント
comments = Comment.create!([
  {
  content: "美味しそうな食べ物の画像を貼ってください",
  user_id: 2,
  image: nil,
  all_users_chat_id: 1,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  }
  ])

  # images_attributes: [{image:File.open('./app/assets/images/auc_01.png',)}]