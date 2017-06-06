/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/5/26 20:47:50                           */
/*==============================================================*/

create database OnlineFoodCourt;
use OnlineFoodCourt;

drop table if exists Customer;

drop table if exists Dish;

drop table if exists OrderItem;

drop table if exists Orders;

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer
(
   username             varchar(32) not null,
   password             varchar(32),
   email                varchar(32),
   primary key (username)
);

/*==============================================================*/
/* Table: Dish                                                  */
/*==============================================================*/
create table Dish
(
   dishid               int AUTO_INCREMENT not null,
   name                 varchar(128),
   price                float,
   description          varchar(256),
   imgurl               varchar(1024),
   discount             float,
   primary key (dishid)
);

/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
create table OrderItem
(
   dishid               int not null,
   orderid              varchar(64) not null,
   count                int,
   finalprice           float,
   primary key (dishid, orderid)
);

/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders
(
   orderid              varchar(64) not null,
   username             varchar(32),
   time                 datetime,
   count                int,
   totalptice           int,
   paystatus            varchar(16),
   address              varchar(64),
   tel                  varchar(16),
   primary key (orderid)
);

alter table OrderItem add constraint FK_OrderItem foreign key (dishid)
      references Dish (dishid);

alter table OrderItem add constraint FK_OrderItem2 foreign key (orderid)
      references Orders (orderid);

alter table Orders add constraint FK_Relationship_1 foreign key (username)
      references Customer (username);

insert into Dish values (1, '潇湘煮雨虾仁饭【麻辣】', 34, '龙虾饭－拍案，手起刀落，拆头去壳取线的整只龙虾跃然入锅，滚油中红辣青麻绕一圈，铁勺荡起盛盘，咸鲜麻辣。', 'https://fuss10.elemecdn.com/1/aa/c50c5db007533aebe6beee1ee9d47jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (2, '气吞山河虾仁饭【泰咖喱】', 36, '龙虾饭－当年泰国拳王造访中原，水土不服食欲不振，掀翻了无数餐桌。周大虾将咖喱的特殊香气与小龙虾的劲道口感结合，抚慰了拳王的脾胃与拳头。', 'https://fuss10.elemecdn.com/b/11/633818411b091c957217f6ab3b055jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (3, '中原一点红虾仁饭【泡椒】', 34, '龙虾饭－辛口开胃，辣而不燥。游历江湖时，周大虾用这道精制泡椒龙虾饭征服了蜀中唐门。', 'https://fuss10.elemecdn.com/3/44/a162e4d14b4940be38d96be1da9cdjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (4, '无影腿【碳烤鸡腿肉】', 12, '小食－洪七公都吃不到美味，你却可以。', 'https://fuss10.elemecdn.com/1/ba/8a45914cd83ab2c384b0b205a2c47jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (5, '煮酒论剑虾仁饭【菌菇】', 38, '龙虾饭－菌类中富含人体所需的18中氨基酸，传说小龙女在绝情谷下，除了喝蜂蜜吃白鱼，在龙虾季也会为自己做一道菌菇小龙虾。', 'https://fuss10.elemecdn.com/2/3f/5449db9bf00cc4d89a8982a6bfccajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (6, '加一份龙虾【麻辣】', 28, '加份龙虾－【单份】麻辣龙虾，不含米饭', 'https://fuss10.elemecdn.com/c/03/f4d261a7f3c1f2ed9183980329bd9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (7, '红豆相思【红豆沙】', 8, '小食－两岸人家微雨后，收红豆，树底纤纤抬素手，浸水煮熟碾成泥，溶糖水。', 'https://fuss10.elemecdn.com/5/25/44e3b02658ddc8437c0be128de9f6jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (8, '丰满羽翼【蜜汁鸡翅】', 9, '小食－运内力抄起银签将鸡翅串起，隔明火碳烤，不间断刷上蜂巢蜜酿，一盏茶时间，便色香味俱全。', 'https://fuss10.elemecdn.com/7/5d/4d9489f98d217d7fcf919a0b02114jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (9, '油赤鸡肉丸【照烧鸡肉丸】', 10, '小食－都说杀鸡焉用宰牛刀，这鸡肉一定要大刀阔斧剁成丸，淋上照烧酱！', 'https://fuss10.elemecdn.com/a/c7/3c4f71422cc2055d2217fb10315c6jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (10, '紫青银羽【芋圆紫米粥】', 10, '小食－华夏传统甜点，芋圆弹齿口感，令人难忘，辅以益气补血之紫米，深受江湖人士热爱。', 'https://fuss10.elemecdn.com/1/a5/c1b5cf20cee6654d2f8e143c270c6jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (11, '中原一点红虾仁饭【泡椒】', 34, '龙虾饭－辛口开胃，辣而不燥。游历江湖时，周大虾用这道精制泡椒龙虾饭征服了蜀中唐门。', 'https://fuss10.elemecdn.com/3/44/a162e4d14b4940be38d96be1da9cdjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (12, '煮酒论剑虾仁饭【菌菇】', 38, '龙虾饭－菌类中富含人体所需的18中氨基酸，传说小龙女在绝情谷下，除了喝蜂蜜吃白鱼，在龙虾季也会为自己做一道菌菇小龙虾。', 'https://fuss10.elemecdn.com/2/3f/5449db9bf00cc4d89a8982a6bfccajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (13, '气吞山河虾仁饭【泰咖喱】', 36, '龙虾饭－当年泰国拳王造访中原，水土不服食欲不振，掀翻了无数餐桌。周大虾将咖喱的特殊香气与小龙虾的劲道口感结合，抚慰了拳王的脾胃与拳头。', 'https://fuss10.elemecdn.com/b/11/633818411b091c957217f6ab3b055jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (14, '潇湘煮雨虾仁饭【麻辣】', 34, '龙虾饭－拍案，手起刀落，拆头去壳取线的整只龙虾跃然入锅，滚油中红辣青麻绕一圈，铁勺荡起盛盘，咸鲜麻辣。', 'https://fuss10.elemecdn.com/1/aa/c50c5db007533aebe6beee1ee9d47jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (15, '银勾鉄划虾仁饭【奶油蘑菇】', 38, '龙虾饭－香嫩奶油，柔软磨菇，四两拨千斤。Q弹虾肉，文火慢炖，三碗通大道。', 'https://fuss10.elemecdn.com/0/67/d2025049f2981b80a0490cc6e63f6jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (16, '黯然销魂虾仁饭【酸菜】', 34, '龙虾饭－老坛酸菜，古称菹，《周礼》中就有其名。巍巍华夏，处处酸菜皆养人，养了古人养今人。', 'https://fuss10.elemecdn.com/c/60/684098ccf54db04b0bdb0470a8d38jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (17, '纵酒狂歌虾仁饭【墨西哥】', 36, '龙虾饭－闯荡异乡时，曾与一墨西哥侠士结伴，他时常烹饪家乡料理，以解思乡，不料英雄白骨未能返家，我便以此菜追忆之。', 'https://fuss10.elemecdn.com/1/bd/869c1aff8385657aa076148a43e36jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (18, '十三香虾仁饭【微辣】', 36, '龙虾饭－仿佛穿身进入时间的长河，抓取这一股北宋年间的香气，运气掌火，十三香入锅，是历史浓厚的味道。', 'https://fuss10.elemecdn.com/e/ce/bf13557c6e909cf40cc62d1c889d8jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (19, '十三香虾仁饭【经典原味】', 36, '龙虾饭－仿佛穿身进入时间的长河，抓取这一股北宋年间的香气，运气掌火，十三香入锅，是历史浓厚的味道。', 'https://fuss10.elemecdn.com/e/ce/bf13557c6e909cf40cc62d1c889d8jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (20, '紫青银羽【芋圆紫米粥】', 10, '小食－华夏传统甜点，芋圆弹齿口感，令人难忘，辅以益气补血之紫米，深受江湖人士热爱。', 'https://fuss10.elemecdn.com/1/a5/c1b5cf20cee6654d2f8e143c270c6jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (21, '金玉良言【玉米棒】', 3.5, '小食－江湖人浪迹天涯粗茶淡饭，前不挨村后不着店时，一根玉米御饥寒。', 'https://fuss10.elemecdn.com/c/7d/69f9b67c8ae2ba4a0d9be764313d4jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (22, '无影腿【碳烤鸡腿肉】', 12, '小食－洪七公都吃不到美味，你却可以。', 'https://fuss10.elemecdn.com/1/ba/8a45914cd83ab2c384b0b205a2c47jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (23, '红豆相思【红豆沙】', 8, '小食－两岸人家微雨后，收红豆，树底纤纤抬素手，浸水煮熟碾成泥，溶糖水。', 'https://fuss10.elemecdn.com/5/25/44e3b02658ddc8437c0be128de9f6jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (24, '油赤鸡肉丸【照烧鸡肉丸】', 10, '小食－都说杀鸡焉用宰牛刀，这鸡肉一定要大刀阔斧剁成丸，淋上照烧酱！', 'https://fuss10.elemecdn.com/a/c7/3c4f71422cc2055d2217fb10315c6jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (25, '丰满羽翼【蜜汁鸡翅】', 9, '小食－运内力抄起银签将鸡翅串起，隔明火碳烤，不间断刷上蜂巢蜜酿，一盏茶时间，便色香味俱全。', 'https://fuss10.elemecdn.com/7/5d/4d9489f98d217d7fcf919a0b02114jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (26, '曲项天歌【麻辣鸭脖】', 15, '小食－成品色泽深红，具有香、辣、甘、麻、咸、 酥、绵等特点，是一道开胃、佐酒佳肴。', 'https://fuss10.elemecdn.com/d/27/6792d0af1bde87ec8914bf9ecaaf7jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (27, '筋津有道【碳烤腹膜肉】', 12, '小食－一只鸡只有十克的“黄金鸡腰肉”，经优质果木精心碳烤，习武之人最爱这原始烤制的筋道和味道。', 'https://fuss10.elemecdn.com/7/20/0ea9eafad3cf08e795e0f96e43582jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (28, '冰清玉润【银耳羹】', 8, '小食－银耳味甘、淡、性平，还富有天然植物性胶质，最受侠女们喜爱。', 'https://fuss10.elemecdn.com/c/a3/81a48be67cdd0a2f91c76dcbd7859jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (29, '藕花馥郁【桂花莲藕粥】', 9, '小食－白藕新花照水开，红窗小舫信风回，遥知天上桂花孤，试问嫦娥更要无？', 'https://fuss10.elemecdn.com/2/24/7863eac7d8623e96ec89d77297c9ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (30, '豆藿明珠【盐水毛豆】', 6, '小食－混迹江湖，怎能不来一盘盐水毛豆。', 'https://fuss10.elemecdn.com/6/d0/2d6217066d85a7cd19fb654fff753jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (31, '白碧秀骨【红枣薏米煲龙骨】', 15, '汤品－红枣宁神，薏米祛湿，龙骨补气，周大虾时常为师父熬制。', 'https://fuss10.elemecdn.com/f/1f/4ec1338e99c4351a19a421e9d13c2jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (32, '元气十足【花生仁无花果煲猪肚】', 15, '汤品－四季进补，养胃为先。行走江湖的侠士都说，无花果加入清炖猪肚，汤浓味美。', 'https://fuss10.elemecdn.com/c/14/505efe9fa5634dfea5a2bce6839e1jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (33, '加一份龙虾【麻辣】', 28, '加份龙虾－【单份】麻辣龙虾，不含米饭', 'https://fuss10.elemecdn.com/c/03/f4d261a7f3c1f2ed9183980329bd9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (34, '加一份龙虾【奶油蘑菇】', 32, '加份龙虾－【单份】奶油蘑菇龙虾，不含米饭', 'https://fuss10.elemecdn.com/2/92/5636ab19b135e2693e1756ae34ef1jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (35, '加一份龙虾【泡椒】', 28, '加份龙虾－【单份】泡椒龙虾，不含米饭', 'https://fuss10.elemecdn.com/3/22/b53a3099ea4f6c2cef3e67deac43ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (36, '加一份龙虾【菌菇】', 32, '加份龙虾－【单份】菌菇龙虾，不含米饭', 'https://fuss10.elemecdn.com/2/6a/fbeeb6b7847e2b5f2ce55822e6ac4jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (37, '加一份龙虾【泰咖喱】', 30, '加份龙虾－【单份】泰咖喱龙虾，不含米饭', 'https://fuss10.elemecdn.com/9/d4/1248694fd9e793e47de583276b34ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (38, '加一份龙虾【酸菜】', 28, '加份龙虾－【单份】酸菜龙虾，不含米饭', 'https://fuss10.elemecdn.com/a/ec/f7e754b1e4f2c2db9124e224a060cjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (39, '加一份龙虾【十三香微辣】', 30, '加份龙虾－【单份】十三香龙虾，不含米饭', 'https://fuss10.elemecdn.com/0/d0/90b3c99e94949deaa06a801c78728jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (40, '加一份龙虾【十三香经典原味】', 30, '加份龙虾－【单份】十三香龙虾，不含米饭', 'https://fuss10.elemecdn.com/0/d0/90b3c99e94949deaa06a801c78728jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (41, '加一份龙虾【墨西哥】', 30, '加份龙虾－【单份】墨西哥龙虾，不含米饭', 'https://fuss10.elemecdn.com/6/81/3643288b57d66a4bc2a295bdb474ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (42, '可口可乐', 4, '饮料－330ml', 'https://fuss10.elemecdn.com/8/44/d079d2eee397dffedc7c333087474jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (43, '雪碧', 4, '饮料－330ml', 'https://fuss10.elemecdn.com/5/63/e393a608d0b8f13b696ee7a13444ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (44, '维他柠檬茶', 5, '饮料－250ml', 'https://fuss10.elemecdn.com/3/8e/c1e3867a452e85aa51fe75b854fddjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (45, '冰糖雪梨', 4, '饮料－500ml', 'https://fuss10.elemecdn.com/9/cb/24ce8ea97ef6bd172108af7e3e694jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (46, '加多宝', 5, '饮料－310ml', 'https://fuss10.elemecdn.com/d/60/4f474dfa85fd798a9e0cc00a00688jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (47, '小茗同学', 6, '饮料－480ml', 'https://fuss10.elemecdn.com/2/eb/eaeefde5ad79d29bb43883402ea5cjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (48, '低糖三得利乌龙茶', 3, '饮料－500ml', 'https://fuss10.elemecdn.com/f/db/57da2f8cca8f27132733bf4151fbfjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (49, '日式照烧鸡排原味咖喱饭', 29, '咖喱饭－18种独特香料与苹果融合成柔和且充满层次的风味，承袭近半世纪的梦咖喱之味。', 'https://fuss10.elemecdn.com/9/d8/d488de003e232c07f2d2706cf8927jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (50, '美式奥尔良鸡腿原味咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配18种香料熬制的日本原味梦咖喱，一口就满足！', 'https://fuss10.elemecdn.com/7/c6/2774191f1f23771aedf2aa5435351jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (51, '蒜香火烤嫩鸡排原味咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配18种香料熬制的日本原味梦咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/4/4f/3a6f94fb2dc537e2db182df62c6d0jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (52, '日式照烧鸡排轰辣咖喱饭', 29, '咖喱饭－日本辛口咖喱，融合牛肉与辛香料的独特辛辣，推荐尝试。', 'https://fuss10.elemecdn.com/2/29/42457c00afce5b4680d5e07d0994ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (53, '蒜香火烤嫩鸡排轰辣咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配牛肉与辛香料混合熬制的辛口咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/1/b9/7161cacc050bfc73972322251a3bcjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (54, '澳洲黑胡椒鸡腿原味咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配18种香料熬制的日本原味梦咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/7/45/8e877f853f46ebc1ae85871106312jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (55, '维他柠檬茶', 4, '缤纷酷饮－250ml维他柠檬茶', 'https://fuss10.elemecdn.com/6/99/aa0a0704d0c4c0fe5098d2de35763jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (56, '照烧鸡肉丸', 7, '加餐主力－日式照烧酱烤入扎实的鸡肉丸子，肉吃不够？再来一串！', 'https://fuss10.elemecdn.com/9/b6/99c5895e53976b95511c91b8848abjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (57, '巴西BBQ翅根（1对）', 8, '加餐主力－舌尖也要跳舞！BBQ南美风情烧烤翅根，体会到扑面香气与火辣热情了么？', 'https://fuss10.elemecdn.com/b/d6/135927cc97e00540d9d12fa1ad670jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (58, '日式照烧鸡排', 11, '加餐主力－照烧酱完整地包覆着厚实又有弹性的鸡排，味道醇厚，难以抵挡！', 'https://fuss10.elemecdn.com/0/e5/131a100ef4249ba13bc9fee6291e9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (59, '黑椒妙趣餐', 42, '套餐－澳洲黑胡椒鸡腿原味咖喱饭+可口可乐1听', 'https://fuss10.elemecdn.com/b/3f/612307df9d97b56969ff8310a10fejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (60, '蒜香火烤嫩鸡排原味咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配18种香料熬制的日本原味梦咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/4/4f/3a6f94fb2dc537e2db182df62c6d0jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (61, '蒜香火烤嫩鸡排轰辣咖喱饭', 26, '咖喱饭－小火慢烤以蒜香点缀的鲜嫩鸡排，搭配牛肉与辛香料混合熬制的辛口咖喱，享受此刻吧！', 'https://fuss10.elemecdn.com/1/b9/7161cacc050bfc73972322251a3bcjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (62, '巴西BBQ翅根原味咖喱饭', 26, '咖喱饭－拉美风情BBQ烧烤翅根，搭配18种香料熬制的日本原味梦咖喱，让你舌尖也跳舞！', 'https://fuss10.elemecdn.com/9/cd/79f07ba17fbb16e5b06fe56e7e322jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (63, '巴西BBQ翅根轰辣咖喱饭', 26, '咖喱饭－拉美风情BBQ烧烤翅根，搭配牛肉与辛香料混合熬制的辛口咖喱，让你舌尖也跳舞！', 'https://fuss10.elemecdn.com/6/2b/dc5d6ff6bc1a28d29bf45105cca7djpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (64, '巴西BBQ翅根红咖喱饭', 26, '咖喱饭－拉美风情BBQ烧烤翅根，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，让你舌尖也跳舞！', 'https://fuss10.elemecdn.com/3/85/14d5c0fdf05676e46e45f8c262068jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (65, '日式照烧鸡排原味咖喱饭', 29, '咖喱饭－18种独特香料与苹果融合成柔和且充满层次的风味，承袭近半世纪的梦咖喱之味。', 'https://fuss10.elemecdn.com/9/d8/d488de003e232c07f2d2706cf8927jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (66, '日式照烧鸡排轰辣咖喱饭', 29, '咖喱饭－日本辛口咖喱，融合牛肉与辛香料的独特辛辣，推荐尝试。', 'https://fuss10.elemecdn.com/2/29/42457c00afce5b4680d5e07d0994ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (67, '日式照烧鸡排红咖喱饭', 29, '咖喱饭－香味浓郁，鲜辣刺激，来自泰国辣椒与虾酱的结合，再加入椰浆柔化辣度。', 'https://fuss10.elemecdn.com/a/54/7d52800d16a1d597a50e229372dbejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (68, '澳洲黑胡椒鸡腿原味咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配18种香料熬制的日本原味梦咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/7/45/8e877f853f46ebc1ae85871106312jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (69, '澳洲黑胡椒鸡腿轰辣咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配牛肉与辛香料混合熬制的辛口咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/b/52/92ae12ff8db514806317c65612cdfjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (70, '澳洲黑胡椒鸡腿绿咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/e/24/c6e1754b66c70af8676087718346ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (71, '澳洲黑胡椒鸡腿红咖喱饭', 30, '咖喱饭－黑椒与鸡腿的联袂出演，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，用心给你好味道！', 'https://fuss10.elemecdn.com/3/16/bacd7a47f86db0f0f23e1644e9727jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (72, '美式奥尔良鸡腿原味咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配18种香料熬制的日本原味梦咖喱，一口就满足！', 'https://fuss10.elemecdn.com/7/c6/2774191f1f23771aedf2aa5435351jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (73, '美式奥尔良鸡腿轰辣咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配牛肉与辛香料混合熬制的辛口咖喱，一口就满足！', 'https://fuss10.elemecdn.com/b/d7/8a4bf1ed943386d544c13de40c9eejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (74, '美式奥尔良鸡腿绿咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，一口就满足！', 'https://fuss10.elemecdn.com/1/c0/cbc399323b13310a271f0877271b5jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (75, '美式奥尔良鸡腿红咖喱饭', 30, '咖喱饭－浪漫美式奥尔良口味鸡腿，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，一口就满足！', 'https://fuss10.elemecdn.com/3/02/b43ba04d1893b7b349081e2a6e706jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (76, '法式鸡胸肉卷原味咖喱饭', 26, '咖喱饭－18种独特香料与苹果融合成柔和且充满层次的风味，承袭近半世纪的梦咖喱之味。', 'https://fuss10.elemecdn.com/7/76/c75ed03eda11b52f31f6ad45fd906jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (77, '法式鸡胸肉卷轰辣咖喱饭', 26, '咖喱饭－日本辛口咖喱，融合牛肉与辛香料的独特辛辣，推荐尝试。', 'https://fuss10.elemecdn.com/7/60/cd2d27bcacca65a428c379678eca8jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (78, '法式鸡胸肉卷红咖喱饭', 26, '咖喱饭－香味浓郁，鲜辣刺激，来自泰国辣椒与虾酱的结合，再加入椰浆柔化辣度。', 'https://fuss10.elemecdn.com/4/2f/fe3e24315edd4ee61edce4c2d183cjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (79, '轰棒槌', 6, '加餐主力－能量健康玉米棒，甜甜糯糯！', 'https://fuss10.elemecdn.com/0/1b/05eb5501bd689af823ec26e9c2baejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (80, '美式奥尔良鸡腿', 11, '加餐主力－回味舌尖，让我们一起漾在浪漫美式情怀的奥尔良味道中！', 'https://fuss10.elemecdn.com/4/d4/0845ec1b0daa75bbf4aa239af4104jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (81, '巴西BBQ翅根（1对）', 8, '加餐主力－舌尖也要跳舞！BBQ南美风情烧烤翅根，体会到扑面香气与火辣热情了么？', 'https://fuss10.elemecdn.com/b/d6/135927cc97e00540d9d12fa1ad670jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (82, '轰咖大白饭', 3, '米饭－精选好米。', 'https://fuss10.elemecdn.com/5/fc/46aa6107948daeb60de965f57db26jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (83, '法式鸡胸肉卷', 9, '加餐主力－法式香料腌制鸡胸肉搭配时蔬，谁说肉卷不多情，cest la vie ！', 'https://fuss10.elemecdn.com/2/ef/43bb93318218350fd6a762325f353jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (84, '照烧鸡肉丸', 7, '加餐主力－日式照烧酱烤入扎实的鸡肉丸子，肉吃不够？再来一串！', 'https://fuss10.elemecdn.com/9/b6/99c5895e53976b95511c91b8848abjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (85, '澳洲黑胡椒鸡腿', 11, '加餐主力－黑椒与鸡腿的联袂出演，用心给你好味道！', 'https://fuss10.elemecdn.com/4/b5/8531bb74d524119bba562e4d3609fjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (86, '墨西哥香辣鸡腿', 11, '加餐主力－这般炫酷叼炸天的鸡腿，香辣入味，肉味浓郁，能吃到绝壁是上辈子拯救了银河系！', 'https://fuss10.elemecdn.com/3/da/0610aaf981df727eb4d982b00ab59jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (87, '日式照烧鸡排', 11, '加餐主力－照烧酱完整地包覆着厚实又有弹性的鸡排，味道醇厚，难以抵挡！', 'https://fuss10.elemecdn.com/0/e5/131a100ef4249ba13bc9fee6291e9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (88, '蒜香火烤嫩鸡排', 9, '加餐主力－以蒜香点缀小火慢烤的鲜嫩鸡排，享受，就从这里开始！', 'https://fuss10.elemecdn.com/b/ba/1c763fd32d72296596e027d2d914ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (89, '麻辣鸭脖', 15, '加餐主力－麻辣入味，速速来啃~', 'https://fuss10.elemecdn.com/3/aa/4d0c215d2974b2898090d7d0b4782jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (90, '筋津有味', 17, '加餐主力－碳烤半筋半肉黄金鸡腰肉，有筋道的嚼感，有解馋的抚慰感，再来一份？(200g)', 'https://fuss10.elemecdn.com/9/81/f62e69bcb8fabd111e147212afec4jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (91, '巴蜀藤椒鸡腿', 9, '加餐主力－藤椒长时间腌制带来独特的辣与微微的麻，好巧，师兄，尝尝新品吧！', 'https://fuss10.elemecdn.com/3/6e/4a4665287f74d8ee8d69d3b3c3992jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (92, '蒜香炭烤乳猪排', 9, '加餐主力－炭火烧烤的粗犷风格与乳猪的细嫩口感交织而成的美味！', 'https://fuss10.elemecdn.com/7/d4/269a58c2b2caac6c5a58fb563b147jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (93, '盐水毛豆', 6, '加餐主力－颗粒饱满，小食好配。', 'https://fuss10.elemecdn.com/2/f6/ebd870206e10f26d6907527bc7670jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (94, '统一冰糖雪梨', 4, '缤纷酷饮－500ml瓶装统一冰糖雪梨', 'https://fuss10.elemecdn.com/e/a7/f51314089f4e0794a9a248fe0c982jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (95, '维他柠檬茶', 4, '缤纷酷饮－250ml维他柠檬茶', 'https://fuss10.elemecdn.com/6/99/aa0a0704d0c4c0fe5098d2de35763jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (96, '可口可乐', 4, '缤纷酷饮－330ml听装可乐', 'https://fuss10.elemecdn.com/a/3e/ffac0c26dba31e6ecbb72c63cf278jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (97, '雪碧', 4, '缤纷酷饮－330ml听装雪碧', 'https://fuss10.elemecdn.com/f/72/4e5d8bfa0f56eed767d1f11caaa14jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (98, '加多宝', 5, '缤纷酷饮－310ml听装加多宝', 'https://fuss10.elemecdn.com/d/55/a67fc02a2d35efe3abe14453b4271jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (99, '小茗同学', 6, '缤纷酷饮－480ml瓶装小茗同学', 'https://fuss10.elemecdn.com/4/53/cfc093a0775766492b894ee847351jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (100, '低糖三得利乌龙茶', 3, '缤纷酷饮－500ml瓶装乌龙茶', 'https://fuss10.elemecdn.com/d/9b/2ebfe18113b74b0623377a2576960jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (101, '比翼超值餐', 41, '套餐－拉美风情BBQ翅根辅以原味梦咖喱饭，再来一份能量轰炸玉米棒槌与可口可乐，羡煞旁人！', 'https://fuss10.elemecdn.com/c/2c/278a20a706ed2ff1d89b28bc685d5jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (102, '天生大腿原味咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配18种香料熬制的日本原味梦咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/7/5f/7c83c01f653dbfa8cb177bbc1dae3jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (103, '天生大腿轰辣咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配牛肉与辛香料混合熬制的辛口咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/9/f6/e116bb01d61a08f6e2da878c0409ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (104, '天生大腿红咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/0/a3/ab90c3c847b7c134077034971b67ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (105, '天生大腿绿咖喱饭', 32, '咖喱饭－按摩入味300g大鸡腿，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，两段式烤制香嫩可口！', 'https://fuss10.elemecdn.com/8/08/d220b931e4ab93ecd6c9b7349f03ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (106, '墨西哥香辣鸡腿原味咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配18种香料熬制的日本原味梦咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/e/d3/1acb65e92e251b1230ed43ecdc812jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (107, '墨西哥香辣鸡腿轰辣咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配牛肉与辛香料混合熬制的辛口咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/b/7b/1cbb9816999d721b6076d546f3b96jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (108, '墨西哥香辣鸡腿红咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/f/ff/77ec2ad1785e5d89677e6bc23c181jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (109, '墨西哥香辣鸡腿绿咖喱饭', 29, '咖喱饭－这般炫酷叼炸天的香辣鸡腿，搭配新鲜罗勒&amp;薄荷叶&amp;柠檬叶的异国绿咖喱，一餐就能拯救银河系！', 'https://fuss10.elemecdn.com/e/73/11c86c8d0989362c5e3861a06aa11jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (110, '蒜香炭烤乳猪排原味咖喱饭', 26, '咖喱饭－炭烤的粗犷融合乳猪的细嫩，搭配18种香料熬制的日本原味梦咖喱，多汁美味！', 'https://fuss10.elemecdn.com/2/ac/ecc5de70c93723796c8ddc91b7ef2jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (111, '蒜香炭烤乳猪排轰辣咖喱饭', 26, '咖喱饭－炭烤的粗犷融合乳猪的细嫩，搭配牛肉与辛香料混合熬制的辛口咖喱，多汁美味！', 'https://fuss10.elemecdn.com/8/27/88240a25424cc3d3f5b3767b68dadjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (112, '巴蜀藤椒鸡腿原味咖喱饭', 26, '咖喱饭－藤椒长时间腌制带来独特麻辣，搭配18种香料熬制的日本原味梦咖喱，不尝尝么？', 'https://fuss10.elemecdn.com/8/3d/002c5c2d4244a2865752b6baae44ejpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (113, '巴蜀藤椒鸡腿轰辣咖喱饭', 26, '咖喱饭－藤椒长时间腌制带来独特麻辣，搭配牛肉与辛香料混合熬制的辛口咖喱，不尝尝么？', 'https://fuss10.elemecdn.com/b/2d/35ce368225199dacb0c812449cf5fjpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (114, '巴蜀藤椒鸡腿红咖喱饭', 26, '咖喱饭－藤椒长时间腌制带来独特麻辣，搭配泰式椰浆虾酱&amp;辣椒秘制的红咖喱，不尝尝么？', 'https://fuss10.elemecdn.com/a/6b/73f20893ae2a0499f00290f13b3c9jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (115, '桂花莲藕粥', 9, '美味甜汤－甜甜滋润。', 'https://fuss10.elemecdn.com/4/84/c11ea72093c7526ff9be055af3173jpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (116, '咖喱伴侣奶油球', 1, '奶油球－有伴侣的不止有咖啡，还有咖喱！轰咖实验室发现，奶油球倒入咖喱里搅拌，味道更佳！', 'https://fuss10.elemecdn.com/1/0f/2e3d1b95ac7b6988c417acbc73a3djpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);
insert into Dish values (117, '517轰大餐', 52, '套餐－澳洲黑胡椒鸡腿原味咖喱饭+BBQ翅根1对+可口可乐1听', 'https://fuss10.elemecdn.com/c/37/1c22958f35a36e22bdea71f34f92ajpeg.jpeg?imageMogr2/thumbnail/80x80', 1.0);

update Dish set discount=price-2 where price>5
update Dish set discount=price where price<6
