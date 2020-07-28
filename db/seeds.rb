# ユーザー登録
users = User.create!([
  {name: "guest", email: "guest@mail.com",password:"guest000"},
  {name: "tanaka", email: "tanaka@mail.com",password:"tanaka00",image:File.open('./app/assets/images/user2.jpg')},
  {name: "suzuki", email: "suzuki@mail.com",password:"suzuki00",image:File.open('./app/assets/images/user3.jpg')},
  {name: "yamada", email: "yamada@mail.com",password:"yamada00",image:File.open('./app/assets/images/user4.jpg')},
  {name: "nishikawa", email: "nishikawa@mail.com",password:"nishikawa00",image:File.open('./app/assets/images/user5.jpg')},
  {name: "okukawa", email: "okukawa@mail.com",password:"okukawa00",image:File.open('./app/assets/images/user6.jpg')}
 ])

# トップページ一覧表示用アイテム
all_users_chats = AllUsersChat.create!([
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
  },
  {
  name: "グルメについて語りましょう",
  user_id: 2,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  image:File.open('./app/assets/images/auc_01.png'),
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
  },
  {
  content: "お腹空いた",
  user_id: 3,
  image:File.open('./app/assets/images/comment_1.jpg'),
  all_users_chat_id: 10,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  }
  ])

# 初期グループ作成
groups = Group.create!([
  {
  name: "Aチームの集会",
  user_id: 2,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  }
  ])

# 初期group_users作成
group_users = GroupUser.create!([
  {group_id:1,user_id:1},
  {group_id:1,user_id:2},
  {group_id:1,user_id:3},
  {group_id:1,user_id:4},
  {group_id:1,user_id:5},
  {group_id:1,user_id:6}
])

# 初期グループメッセージ作成
messages = Message.create!([
  {
  content: "チームAのグループを作りました！",
  image: nil,
  group_id: 1,
  user_id: 2,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  },
  {
  content: "開設ありがとうございます！",
  image: nil,
  group_id: 1,
  user_id: 3,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  },
  {
  content: "宜しくお願いします",
  image: nil,
  group_id: 1,
  user_id: 4,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  },
  {
  content: "招待ありがとうございます",
  image: nil,
  group_id: 1,
  user_id: 5,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  },
  {
  content: "こんにちは。宜しくお願いします！",
  image: nil,
  group_id: 1,
  user_id: 6,
  created_at: 2020-07-02,
  updated_at: 2020-07-02,
  }
  ])

  # images_attributes: [{image:File.open('./app/assets/images/auc_01.png',)}]