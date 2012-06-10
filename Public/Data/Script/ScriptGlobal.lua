
--生活技能id 编号

	OR_OK								= 0		-- 成功,如果返回0即为成功,返回下面的其他值都为失败
	OR_ERROR							= -1	-- 未知错误
	OR_DIE								= -2	-- 你已死亡
	OR_INVALID_SKILL					= -3	-- 无效技能
	OR_TARGET_DIE						= -4	-- 目标已死亡
	OR_LACK_MANA						= -5	-- MANA不足
	OR_COOL_DOWNING						= -6	-- 冷确时间未到
	OR_NO_TARGET						= -7	-- 没有目标
	OR_INVALID_TARGET					= -8	-- 无效目标
	OR_OUT_RANGE						= -9	-- 超出射程
	OR_IN_RANGE							= -10	-- 距离太近
	OR_NO_PLATFORM						= -11	-- 没有操作平台
	OR_OUT_PLATFORM						= -12	-- 离操作平台太远
	OR_NO_TOOL							= -13	-- 没有操作工具
	OR_STUFF_LACK						= -14	-- 缺少材料
	OR_BAG_OUT_OF_SPACE					= -15	-- 背包缺少空间
	OR_WARNING							= -16	-- 理论上这些错误将被客户端过滤，所以如果出现，可能来自于一些外挂
	OR_BUSY								= -17	-- 正在做其它事情
	OR_MISSION_HAVE						= -18	-- 已经拥有该任务
	OR_MISSION_LIST_FULL				= -19	-- 任务记录已满
	OR_MISSION_NOT_FIND					= -20	-- 你没有这个任务
	OR_EXP_LACK							= -21	-- 熟练度不够
	OR_CHAR_DO_NOT_KNOW_THIS_SKILL		= -22	-- 角色还不会这种技能
	OR_NO_SCRIPT						= -23	-- 目标角色无脚本
	OR_NOT_ENOUGH_HP					= -24	-- 没有足够的生命值
	OR_NOT_ENOUGH_RAGE					= -25	-- 没有足够的怒气值
	OR_NOT_ENOUGH_STRIKE_POINT			= -26	-- 没有足够的连击点
	OR_NOT_ENOUGH_ITEM					= -27	-- 没有足够的道具
	OR_NOT_ENOUGH_VIGOR					= -28	-- 没有足够的活力
	OR_NO_LEVEL							= -29 	-- 技能等级不够
	OR_CANNOT_UPGRADE					= -30	-- 宝石无法再升级
	OR_FAILURE							= -31	-- 操作失败
	OR_GEM_CONFLICT						= -32	-- 一件装备上不允许装备同类型的宝石
	OR_NEED_IN_FURY_STANCE				= -33	-- 需要在狂暴状态下使用
	OR_INVALID_TARGET_POS				= -34	-- 无效目标点
	OR_GEM_SLOT_LACK					= -35	-- 缺乏宝石插口
	OR_LIMIT_MOVE						= -36	-- 无法移动
	OR_LIMIT_USE_SKILL					= -37	-- 无法使用技能
	OR_INACTIVE_SKILL					= -38	-- 使用尚未激活的技能
	OR_TOO_MUCH_HP						= -39	-- HP大于限定数值
	OR_NEED_A_WEAPON					= -40	-- 需要一把武器
	OR_NEED_HIGH_LEVEL_XINFA			= -41	-- 心法等级不够
	OR_NEED_LEARN_SKILL_FIRST			= -42	-- 尚未学会此技能
	OR_NEED_MENPAI_FOR_LEVELUP			= -43	-- 你必须拜师进入一个门派才能继续升级
	OR_U_CANNT_DO_THIS_RIGHT_NOW		= -44 	-- 你现在无法这样做
	OR_ROBOT_TIMEOUT					= -45	-- 挂机时间超时
	OR_NEED_HAPPINESS					= -46	-- 你的珍兽快乐度不足60，不能出战，需要驯养
	OR_NEED_HIGH_LEVEL					= -47	-- 你的等级不够
	OR_CANNOT_GETEXP					= -48	-- 你的珍兽已无法等到经验
	OR_NEED_LIFE						= -49	-- 你的珍兽寿命为0，无法再召唤，请为其增加寿命
	OR_EXP_FULL							= -50	-- 您的经验已经到达上限
	OR_TOO_MANY_TRAPS					= -51 	-- 无法设置更多的此类陷阱
	OR_PET_PLACARD_ISSUE_FAILED			= -52	-- 发布失败
	OR_PET_PLACARD_NOT_APPOINT_PET		= -53	-- 未指定珍兽
	OR_PET_PLACARD_ONLY_CAN_ISSUE_ONE	= -54	-- 对不起，同时只能发布一只珍兽
	OR_PET_PLACARD_NEED_PET_TYPE		= -55	-- 对不起，你的珍兽好像不是宝宝哦
	OR_PET_PLACARD_NEED_PET_LEVEL		= -56	-- 对不起，你的珍兽级别还不够哦
	OR_PET_PLACARD_NEED_PET_HAPPINESS	= -57	-- 对不起，你的珍兽快乐值不够高
	OR_PET_PLACARD_NEED_PET_LIFE		= -58	-- 对不起，你的珍兽寿命不够
	OR_NEED_IN_STEALTH_MODE				= -59	-- 需要在隐身状态下使用
	OR_NOT_ENOUGH_ENERGY				= -60	-- 对不起，你的精力不足
	OR_CAN_NOT_MOVE_STALL_OPEN			= -61	-- 无法在摆摊中移动
	OR_NEED_IN_SHIELD_MODE				= -62	-- 需要在护体保护下
	OR_PET_DIE							= -63	-- 你的珍兽已经死亡
	OR_PET_HADRECALL_NEEDHAPPINESS		= -64	-- 你的珍兽快乐度不足60，已被收回
	OR_PET_HADRECALL_NEEDLIFE			= -65	-- 你的珍兽寿命为0，已被收回
	OR_GEM_NOT_FIT_EQUIP				= -66	-- 这种宝石不能镶嵌在这种装备上
	OR_CANNOT_ASK_PETDETIAL				= -67	-- 你无法察看该珍兽的信息
	OR_ARIANCEPET_CANNOT_RETURNTOCHILD	= -68	-- 变异珍兽不能进行还童
	OR_COMBAT_CANNOT_RETURNTOCHILD		= -69	-- 出战珍兽不能进行还童
	OR_IMPASSABLE_ZONE					= -70	-- 不可走区域
	OR_NEED_SETMINORPASSWORD			= -71	-- 需要设置 二级密码
	OR_NEED_UNLOCKMINORPASSWORD			= -72	-- 需要解锁 二级密码
	OR_PETINEXCHANGE_CANNOT_GOFIGHT		= -73	-- 正在交易的珍兽无法出战
	OR_HASSPOUSE_CANNOT_RETURNTOCHILD	= -74	-- 已经有配偶的珍兽不能还童
	OR_CAN_NOT_FIND_SPECIFIC_ITEM		= -75	-- 缺少指定物品
	OR_HOUSE_SLOT_IS_EMPTY				= -76	-- 需要先装备座骑
	OR_NEED_EQUITATION_FIRST			= -77	-- 需要先学会相应的骑术
	OR_USE_A_DAMAGED_EQUIPMENT			= -78	-- 装备已经损坏
	OR_EQUIPMENT_DAMAGED				= -79	-- 装备已经损坏
	OR_PET_PROCREATE_HAE_REGISTER				= -80	-- 双方中有一人的珍兽已经在此繁殖，不能同时繁殖1个以上的珍兽
	OR_PET_PROCREATE_NO_LOCALITY				= -81	-- 已经没有空位了
	OR_PET_PROCREATE_NEED_BABY_PET				= -82	-- 双方珍兽必需都是珍兽宝宝
	OR_PET_PROCREATE_NEED_SAME_PHYLE			= -83	-- 双方珍兽必需是同类
	OR_PET_PROCREATE_NEED_GENERATION			= -84	-- 双方珍兽必需都是一代珍兽
	OR_PET_PROCREATE_NEED_HAPPINESS				= -85	-- 双方珍兽快乐度必需为满值
	OR_PET_PROCREATE_NEED_SEX					= -86	-- 双方珍兽必需为异性
	OR_PET_PROCREATE_NEED_LEEL_DIFFERENCE		= -87	-- 双方珍兽等级差必需小于5
	OR_PET_PROCREATE_NEED_SPOUSE				= -88	-- 双方珍兽必需无配偶或互为配偶
	OR_PET_PROCREATE_NEED_MONEY					= -89	-- 金钱不够
	OR_PET_PROCREATE_NEED_NO_FIGHT_STATE		= -90	-- 双方珍兽必需都未出战
	OR_PET_PROCREATE_NEED_LIFE					= -91	-- 双方珍兽寿命必需大于1000
	OR_PET_PROCREATE_ERROR_REGISTER				= -92	-- 双方中有一人并没有珍兽在此繁殖
	OR_PET_PROCREATE_NO_FINISHED				= -93	-- 繁殖还未完成
	OR_PET_PROCREATE_HUMAN_PET_LIST_NO_SPACE	= -94	-- 双方有一个人珍兽列表没有足够的空间
	OR_PET_PROCREATE_NEED_2TEAMMEMBER			= -95	-- 必需要两人组成才可以
	OR_PET_PROCREATE_TEAMMEMBER_TOO_FAR			= -96	-- 另一个队员离你太远了
	OR_PET_PROCREATE_NEED_LEEL					= -97	-- 必需达到相应等级
	OR_PET_PROCREATE_NEED_DISTANCE_LEVEL		= -98	-- 与上一次繁殖的时间间隔必需到达20
	OR_PET_PROCREATE_NEED_LEADER				= -99	-- 必需是队长才能有这种操作
	OR_CANNOT_TAKE_MOREPET						= -100	-- 现在不能携带更多的珍兽
	OR_CALLOFHUMAN_NOTSAMESCENE					= -101	-- 你不在普通场景且目标和你不在同一场景
	OR_DRIDE_INVALID_ACCETP						= -102	-- 目标已经取消了对你的邀请
	OR_DRIDE_NOT_RIDE_MOUNT						= -103	-- 邀请者并没有骑上坐骑
	OR_DRIDE_TARGET_MUST_NOT_RIDE_MOUNT			= -104	-- 被邀请者必需没有骑上坐骑
	OR_DRIDE_TARGET_MUST_IDLE					= -105	-- 被邀请者必需为休闲状态
	OR_DRIDE_OUT_RANGE							= -106	-- 被邀请者与你的距离太远
	OR_DRIDE_TARGET_MUST_NOT_CHANGED_MODEL		= -107	-- 被邀请者必需不能变身
	OR_DRIDE_TARGET_MUST_NOT_BY_BUS				= -108;	-- 被邀请者必需不能在坐骑上
	OR_DRIDE_MUST_NOT_TEAM_FOLLOW				= -109;	-- 邀请者必需不能在组队跟随状态
	OR_DRIDE_TARGET_MUST_NOT_TEAM_FOLLOW		= -110;	-- 被邀请者必需不能在组队跟随状态

	OR_REVENGE_NEED_TARGET_ONLINE				= -120	-- 查找不到该玩家
	OR_REVENGE_NEED_TARGET_LEVEL				= -121	-- 对方等级太低
	OR_REVENGE_NOT_TARGET						= -122	-- 你并没有仇杀目标
	OR_REVENGE_NEED_LEVEL						= -123	-- 江湖太危险，还不大适合你
	OR_REVENGE_NEED_PKVALUE						= -124	-- 你杀气太重，还是收手吧
	OR_REVENGE_NEED_NO_TARGET					= -125	-- 你还是先了了现有的仇恨吧
	OR_REVENGE_NEED_COOLDOWN					= -126	-- 你今天已经积累了太多仇恨
	OR_REVENGE_NEED_UNLOCK_PASSWORD				= -127	-- 危险操作，请先打开二级密码
	OR_REVENGE_INVALID_TARGET					= -128	-- 你不能仇杀指定目标
                                                        --
	OR_CANTDO_DIE								= -130	-- 你已经死亡，无法那样做
	OR_CANTDO_LIMIT_MOVE						= -131	-- 你无法移动
	OR_CANTDO_TEAM_FOLLOW_LEADER				= -132	-- 你正处于组队跟随状态，无法那样做
	OR_CANTDO_TEAM_FOLLOW_MEMBER				= -133	-- 你正处于组队跟随状态，无法那样做
	OR_CANTDO_BUS_PASSENGER						= -134	-- 你现在无法那样做
	OR_CANTDO_BUS_CHAUFFEUR						= -135	-- 你现在无法那样做
	OR_CANTDO_MOUNT_PASSENGER					= -136	-- 你正在坐骑上，无法那样做
	OR_CANTDO_MOUNT_CHAUFFEUR					= -137	-- 你正在坐骑上，无法那样做
	OR_CANTDO_FOR_RIDING						= -138	-- 骑乘时无法进行这种操作
	OR_CANTDO_TERROR							= -139	-- 恐惧状态无法进行这种操作
	OR_CANTDO_INSTALL							= -140	-- 摆摊状态无法进行这种操作

	OR_PET_COMPOUND_BUSY						= -150	-- 你必需在站立状态下才能做
	OR_PET_COMPOUND_CANT_IN_SCENE				= -151	-- 出战珍兽不能合成
	OR_PET_COMPOUND_NEED_PET_LEVEL				= -152	-- 你的珍兽不够30级
	OR_PET_COMPOUND_CANT_VARIANCE				= -153	-- 变异珍兽不能合成
	OR_PET_COMPOUND_CANT_HAVE_SPOUSE			= -154	-- 已交配过的珍兽不能合成
	OR_PET_PROCREATE_NO_FINISHED				= -155	-- 别急，你们的珍兽还未繁殖完毕
	OR_PET_PROCREATE_HUMAN_PET_LIST_NO_SPACE	= -156	-- 对不起，你身上的背包空间不够2个

	OR_PET_NOTYOURPET                           = -157 -- 这个珍兽目前不属于你，不能捕捉。

	OR_PET_PROCREATE_QUERY						= -158	-- 查询珍兽繁殖进度

	OR_HEALTH_IS_FULL							= -159	-- 生命值已满
	OR_MANA_IS_FULL								= -160	-- 内力值已满
	OR_SOMETHING_IN_THE_WAY						= -161; -- 行进方向上有障碍物
	OR_PVP_MODE_SWITCH_DELAY					= -162;	-- 从现在起，如果十分钟内不参与PK，您将自动进入和平模式

	OR_DUEL_CAN_NOT_FIND_USER					= -163;	-- 查找不到该玩家或玩家不在线
	OR_DUEL_TARGET_LEVEL_LOW					= -164;	-- 对方等级太低
	OR_DUEL_LEVEL_LOW							= -165;	-- 您的等级太低, 决斗行为还不大适合你
	OR_DUEL_PKVALUE_OVER_LIMIT					= -166; -- 你杀气太重，还是收手吧
	OR_DUEL_ALREADY_IN_DUEL						= -167; -- 您已经在和目标决斗了
	OR_DUEL_LIST_FULL							= -168; -- 您的决斗名额都安排满了,还是先解决一些吧
	OR_DUEL_TARGET_LIST_FULL					= -169; -- 目标的决斗日程都安排满了, 您还是等一等吧.
	OR_DUEL_BUSY								= -170;	-- 您现在很忙,等会儿再试试吧.
	OR_DUEL_TARGET_BUSY							= -171;	-- 目标现在很忙,等会儿再试试吧.
	OR_DUEL_NEED_UNLOCK_PASSWORD				= -172; -- 危险操作，请先打开二级密码

	OR_ENEMY_LIST_FULL							= -173; -- 宣战列表已满

	OR_BUS_PASSENGERFULL						= -200;	-- 目标已无空间
	OR_BUS_HASPASSENGER							= -201;	-- 你已经在车上了
	OR_BUS_NOTINBUS								= -202;	-- 你并不在车上
	OR_BUS_RUNNING								= -203;	-- 车已经出站
	OR_BUS_HASMOUNT								= -204;	-- 你已经在坐骑上了
	OR_BUS_HASPET								= -205;	-- 宠物不能乘坐
	OR_BUS_CANNOT_TEAM_FOLLOW					= -206;	-- 不能是组队跟随状态
	OR_BUS_CANNOT_DRIDE							= -207;	-- 不能是双人骑乘状态
	OR_BUS_CANNOT_CHANGE_MODEL					= -208;	-- 不能是变身状态

	OR_NOTENOUGH_MONEY							= -220; -- 对不起，您身上携带的金钱不足。
	
	DANJIAN_JL30=225	-- 30级奖励
	DANJIAN_JL40=226	-- 40级奖励
	DANJIAN_JL50=227	-- 50级奖励
	DANJIAN_JL60=228	-- 60级奖励
	DANJIAN_JL70=229	-- 70级奖励
	DANJIAN_JL80=230	-- 80级奖励
	DANJIAN_JL90=231	-- 90级奖励
	DANJIAN_JL100=232	-- 100级奖励
	DANJIAN_JL120=233	-- 120级奖励
	DANJIAN_JL149=234	-- 150级奖励

	OR_NO_RIGHT_APPLY_CITY						= -230; -- 您没有权限申请城市
	OR_GEM_NEED_STUFF							= -237; -- 请放入宝石镶嵌符
	
	OR_EXE_SETPASSWORD							= -258;	-- 打开设置二级密码界面
	OR_EXE_CHANGEPASSWORD						= -259;	-- 打开修改二级密码界面
	OR_EXE_UNLOCKPASSWORD						= -260;	-- 打开解锁界面
	OR_PET_PLACARD_AREALDY_HAD_SPOUSE = -261; --珍兽已经有配偶了
	OR_PLAYERSHOP_SAVEBASEMONEY_SUCCESS			= -262; -- 玩家商店存入本金成功....
	OR_PLAYERSHOP_SAVEPROFITMONEY_SUCCESS		= -263; -- 玩家商店存入盈利资金成功....
	OR_GEM_EMBED_LACK							= -264;	-- 对不起，此处只能对前三个孔进行镶嵌
	OR_GEM_NO_FOUR_SLOT						= -265;	-- 对不起，您的装备没有第4个孔洞，无法进行极限镶嵌
	OR_GEM_ENCHASE_FOUR						= -266;	--对不起，您的装备已经进行过极限镶嵌
	OR_GEM_MUST_ENCHASE_THREE			= -267;	--对不起，必须前三个孔全部镶嵌上宝石才能进行极限镶嵌
	OR_GEM_NOT_ENCHASE						= -268; --对不起，此类宝石无法进行极限镶嵌
	
	
	OR_ERROR_NOSHOW							= -999; -- 未知错误，但是不显示此错误

--使用StoreMap 返回类型
	USEITEM_SUCCESS			=	0
	USEITEM_CANNT_USE		=	1
	USEITEM_LEVEL_FAIL		=	2
	USEITEM_TYPE_FAIL		=	3
	USEITEM_SKILL_FAIL		=	4
	USEITEM_INVALID			=	5

--生活技能导师相关变量
ABILITY_TEACHER_SHOP = 11	--导师买工具商店
ABILITY_STUDY = 0			--学习技能
ABILITY_STUDY_OK = 2		--学习技能确认
ABILITY_STUDY_CANCEL = 3	--学习技能取消
ABILITY_DIALOG = {21,22,23,24,25}	--技能说明对话

--人物属性修正相关变量
REFIX_ATTACK_COLD = 21
REFIX_ATTACK_FIRE = 23
REFIX_ATTACK_LIGHT = 25
REFIX_ATTACK_POISON = 27

--功能npc变量定义
PET_FULL	=	40		--给珍兽恢复血和快乐度的事件(不是脚本ID)
PET_FULL_OK	=	41		--确认给珍兽恢复血和快乐度的事件(不是脚本ID)

--金钱显示转换脚本的编号
MONEY_DISPLAY_SCRIPT_ID = 701604

SHIMEN_MISSION_SCRIPT_ID = 229000

--洛阳的种植标志，0 没人种  1还有一块庄稼未回收		2二块未回收  3三块未回收  4 四块未回收
--大理36个,洛阳36个,苏州36个，大理2 36个，大理3 36个，楼兰10个；顺序是大理，洛阳，苏州，大理2，大理3，楼兰
PLANTFLAG = {0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,
						 0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,
				 0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,
							0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,
					0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 --楼兰开始的20个标志
			 0,0,0,0,0,0,0,0,0,0,
			 0,0,0,0,0,0,0,0,0,0,
			 --束河 7 zchw
			 0,0,0,0,0,0,0,
	}

--种植稻草人坐标
--大理36个,洛阳36个,苏州36个，大理2 36个，大理3 36个；顺序是大理，洛阳，苏州，大理2，大理3
PLANTNPC_ADDRESS ={
					{X=116,Z=167,Scene=2,X_MIN=114,X_MAX=118,Z_MIN=165,Z_MAX=169},
					{X=123,Z=167,Scene=2,X_MIN=121,X_MAX=125,Z_MIN=165,Z_MAX=169},
					{X=130,Z=167,Scene=2,X_MIN=128,X_MAX=132,Z_MIN=165,Z_MAX=169},
					{X=116,Z=177,Scene=2,X_MIN=114,X_MAX=118,Z_MIN=175,Z_MAX=179},
					{X=123,Z=177,Scene=2,X_MIN=121,X_MAX=125,Z_MIN=175,Z_MAX=179},
					{X=130,Z=177,Scene=2,X_MIN=128,X_MAX=132,Z_MIN=175,Z_MAX=179},
					{X=116,Z=186,Scene=2,X_MIN=114,X_MAX=118,Z_MIN=184,Z_MAX=188},
					{X=123,Z=186,Scene=2,X_MIN=121,X_MAX=125,Z_MIN=184,Z_MAX=188},
					{X=130,Z=186,Scene=2,X_MIN=128,X_MAX=132,Z_MIN=184,Z_MAX=188},
					{X=90,Z=295,Scene=2,X_MIN=88,X_MAX=92,Z_MIN=293,Z_MAX=297},
					{X=100,Z=295,Scene=2,X_MIN=98,X_MAX=102,Z_MIN=293,Z_MAX=297},
						{X=100,Z=303,Scene=2,X_MIN=98,X_MAX=102,Z_MIN=301,Z_MAX=305},
						{X=222,Z=428,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=426,Z_MAX=430},
						{X=227,Z=428,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=426,Z_MAX=430},
						{X=233,Z=428,Scene=2,X_MIN=231,X_MAX=235,Z_MIN=426,Z_MAX=430},
						{X=239,Z=428,Scene=2,X_MIN=237,X_MAX=241,Z_MIN=426,Z_MAX=430},
						{X=245,Z=428,Scene=2,X_MIN=243,X_MAX=247,Z_MIN=426,Z_MAX=430},
						{X=251,Z=428,Scene=2,X_MIN=249,X_MAX=253,Z_MIN=426,Z_MAX=430},
						{X=222,Z=435,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=433,Z_MAX=437},
						{X=227,Z=435,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=433,Z_MAX=437},
						{X=222,Z=442,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=440,Z_MAX=444},
						{X=227,Z=442,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=440,Z_MAX=444},
						{X=227,Z=449,Scene=2,X_MIN=225,X_MAX=229,Z_MIN=447,Z_MAX=451},
					{X=222,Z=449,Scene=2,X_MIN=220,X_MAX=224,Z_MIN=447,Z_MAX=451},
					{X=335,Z=428,Scene=2,X_MIN=333,X_MAX=337,Z_MIN=426,Z_MAX=430},
					{X=343,Z=428,Scene=2,X_MIN=341,X_MAX=345,Z_MIN=426,Z_MAX=430},
					{X=350,Z=428,Scene=2,X_MIN=348,X_MAX=352,Z_MIN=426,Z_MAX=430},
					{X=337,Z=439,Scene=2,X_MIN=335,X_MAX=339,Z_MIN=437,Z_MAX=441},
					{X=343,Z=439,Scene=2,X_MIN=341,X_MAX=345,Z_MIN=437,Z_MAX=441},
					{X=349,Z=439,Scene=2,X_MIN=347,X_MAX=351,Z_MIN=437,Z_MAX=441},
					{X=431,Z=293,Scene=2,X_MIN=429,X_MAX=433,Z_MIN=291,Z_MAX=295},
					{X=437,Z=293,Scene=2,X_MIN=435,X_MAX=439,Z_MIN=291,Z_MAX=295},
					{X=431,Z=302,Scene=2,X_MIN=429,X_MAX=433,Z_MIN=300,Z_MAX=304},
					{X=439,Z=302,Scene=2,X_MIN=437,X_MAX=441,Z_MIN=300,Z_MAX=304},
					{X=431,Z=311,Scene=2,X_MIN=429,X_MAX=433,Z_MIN=309,Z_MAX=313},
					{X=437,Z=311,Scene=2,X_MIN=435,X_MAX=439,Z_MIN=309,Z_MAX=313},
						{X=137,Z=310,Scene=0,X_MIN=135,X_MAX=139,Z_MIN=308,Z_MAX=312},
						{X=144,Z=310,Scene=0,X_MIN=142,X_MAX=146,Z_MIN=308,Z_MAX=312},
						{X=152,Z=310,Scene=0,X_MIN=150,X_MAX=154,Z_MIN=308,Z_MAX=312},
						{X=159,Z=310,Scene=0,X_MIN=157,X_MAX=161,Z_MIN=308,Z_MAX=312},
						{X=137,Z=319,Scene=0,X_MIN=135,X_MAX=139,Z_MIN=317,Z_MAX=321},
						{X=144,Z=319,Scene=0,X_MIN=142,X_MAX=146,Z_MIN=317,Z_MAX=321},
						{X=152,Z=319,Scene=0,X_MIN=150,X_MAX=154,Z_MIN=317,Z_MAX=321},
						{X=159,Z=319,Scene=0,X_MIN=157,X_MAX=161,Z_MIN=317,Z_MAX=321},
						{X=140,Z=328,Scene=0,X_MIN=138,X_MAX=142,Z_MIN=326,Z_MAX=330},
						{X=147,Z=328,Scene=0,X_MIN=145,X_MAX=149,Z_MIN=326,Z_MAX=330},
						{X=153,Z=328,Scene=0,X_MIN=151,X_MAX=155,Z_MIN=326,Z_MAX=330},
						{X=147,Z=337,Scene=0,X_MIN=145,X_MAX=149,Z_MIN=335,Z_MAX=339},
					{X=174,Z=390,Scene=0,X_MIN=172,X_MAX=176,Z_MIN=388,Z_MAX=392},
					{X=174,Z=398,Scene=0,X_MIN=172,X_MAX=176,Z_MIN=396,Z_MAX=400},
					{X=179,Z=390,Scene=0,X_MIN=177,X_MAX=181,Z_MIN=388,Z_MAX=392},
					{X=179,Z=398,Scene=0,X_MIN=177,X_MAX=181,Z_MIN=396,Z_MAX=400},
					{X=185,Z=390,Scene=0,X_MIN=183,X_MAX=187,Z_MIN=388,Z_MAX=392},
					{X=185,Z=398,Scene=0,X_MIN=183,X_MAX=187,Z_MIN=396,Z_MAX=400},
					{X=190,Z=390,Scene=0,X_MIN=188,X_MAX=192,Z_MIN=388,Z_MAX=392},
					{X=190,Z=398,Scene=0,X_MIN=188,X_MAX=192,Z_MIN=396,Z_MAX=400},
					{X=197,Z=390,Scene=0,X_MIN=195,X_MAX=199,Z_MIN=388,Z_MAX=392},
					{X=197,Z=399,Scene=0,X_MIN=195,X_MAX=199,Z_MIN=397,Z_MAX=401},
					{X=323,Z=390,Scene=0,X_MIN=321,X_MAX=325,Z_MIN=388,Z_MAX=392},
					{X=332,Z=390,Scene=0,X_MIN=330,X_MAX=334,Z_MIN=388,Z_MAX=392},
						{X=365,Z=302,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=300,Z_MAX=304},
						{X=372,Z=302,Scene=0,X_MIN=370,X_MAX=374,Z_MIN=300,Z_MAX=304},
						{X=372,Z=310,Scene=0,X_MIN=370,X_MAX=374,Z_MIN=308,Z_MAX=312},
						{X=365,Z=310,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=308,Z_MAX=312},
						{X=358,Z=310,Scene=0,X_MIN=356,X_MAX=360,Z_MIN=308,Z_MAX=312},
						{X=351,Z=310,Scene=0,X_MIN=349,X_MAX=353,Z_MIN=308,Z_MAX=312},
						{X=351,Z=318,Scene=0,X_MIN=349,X_MAX=353,Z_MIN=316,Z_MAX=320},
						{X=358,Z=318,Scene=0,X_MIN=356,X_MAX=360,Z_MIN=316,Z_MAX=320},
						{X=365,Z=318,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=316,Z_MAX=320},
						{X=372,Z=318,Scene=0,X_MIN=370,X_MAX=374,Z_MIN=316,Z_MAX=320},
						{X=358,Z=327,Scene=0,X_MIN=356,X_MAX=360,Z_MIN=325,Z_MAX=329},
						{X=365,Z=327,Scene=0,X_MIN=363,X_MAX=367,Z_MIN=325,Z_MAX=329},
							{X=214,Z=115,Scene=1,X_MIN=212,X_MAX=216,Z_MIN=113,Z_MAX=117},
							{X=213,Z=124,Scene=1,X_MIN=211,X_MAX=215,Z_MIN=122,Z_MAX=126},
							{X=223,Z=115,Scene=1,X_MIN=221,X_MAX=225,Z_MIN=113,Z_MAX=117},
							{X=223,Z=124,Scene=1,X_MIN=221,X_MAX=225,Z_MIN=122,Z_MAX=126},
							{X=232,Z=114,Scene=1,X_MIN=231,X_MAX=234,Z_MIN=112,Z_MAX=116},
							{X=231,Z=123,Scene=1,X_MIN=229,X_MAX=233,Z_MIN=121,Z_MAX=125},
							{X=241,Z=112,Scene=1,X_MIN=239,X_MAX=243,Z_MIN=110,Z_MAX=114},
							{X=242,Z=120,Scene=1,X_MIN=240,X_MAX=244,Z_MIN=118,Z_MAX=122},
							{X=305,Z=105,Scene=1,X_MIN=303,X_MAX=307,Z_MIN=103,Z_MAX=107},
							{X=303,Z=116,Scene=1,X_MIN=301,X_MAX=305,Z_MIN=114,Z_MAX=118},
							{X=313,Z=105,Scene=1,X_MIN=311,X_MAX=315,Z_MIN=103,Z_MAX=107},
							{X=313,Z=117,Scene=1,X_MIN=311,X_MAX=315,Z_MIN=115,Z_MAX=119},
						{X=322,Z=107,Scene=1,X_MIN=320,X_MAX=324,Z_MIN=105,Z_MAX=109},
						{X=321,Z=119,Scene=1,X_MIN=319,X_MAX=323,Z_MIN=117,Z_MAX=121},
						{X=330,Z=112,Scene=1,X_MIN=328,X_MAX=332,Z_MIN=110,Z_MAX=114},
						{X=331,Z=124,Scene=1,X_MIN=329,X_MAX=333,Z_MIN=122,Z_MAX=126},
						{X=109,Z=192,Scene=1,X_MIN=107,X_MAX=111,Z_MIN=190,Z_MAX=194},
						{X=108,Z=202,Scene=1,X_MIN=106,X_MAX=110,Z_MIN=200,Z_MAX=204},
						{X=101,Z=202,Scene=1,X_MIN=99,X_MAX=103,Z_MIN=200,Z_MAX=204},
						{X=102,Z=213,Scene=1,X_MIN=100,X_MAX=104,Z_MIN=211,Z_MAX=215},
						{X=108,Z=214,Scene=1,X_MIN=106,X_MAX=110,Z_MIN=212,Z_MAX=216},
						{X=129,Z=204,Scene=1,X_MIN=127,X_MAX=131,Z_MIN=202,Z_MAX=206},
						{X=135,Z=212,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=210,Z_MAX=214},
						{X=135,Z=222,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=220,Z_MAX=224},
							{X=127,Z=223,Scene=1,X_MIN=125,X_MAX=129,Z_MIN=221,Z_MAX=225},
							{X=125,Z=232,Scene=1,X_MIN=123,X_MAX=127,Z_MIN=230,Z_MAX=234},
							{X=135,Z=232,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=230,Z_MAX=234},
							{X=126,Z=243,Scene=1,X_MIN=124,X_MAX=128,Z_MIN=241,Z_MAX=245},
							{X=135,Z=243,Scene=1,X_MIN=133,X_MAX=137,Z_MIN=241,Z_MAX=245},
							{X=308,Z=374,Scene=1,X_MIN=306,X_MAX=310,Z_MIN=372,Z_MAX=376},
							{X=318,Z=365,Scene=1,X_MIN=316,X_MAX=320,Z_MIN=363,Z_MAX=367},
							{X=317,Z=374,Scene=1,X_MIN=315,X_MAX=319,Z_MIN=372,Z_MAX=376},
							{X=327,Z=366,Scene=1,X_MIN=325,X_MAX=329,Z_MIN=364,Z_MAX=368},
							{X=327,Z=375,Scene=1,X_MIN=325,X_MAX=329,Z_MIN=373,Z_MAX=377},
							{X=336,Z=367,Scene=1,X_MIN=334,X_MAX=338,Z_MIN=365,Z_MAX=369},
							{X=336,Z=375,Scene=1,X_MIN=334,X_MAX=338,Z_MIN=373,Z_MAX=377},
					{X=37,Z=93,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=90,Z_MAX=96},
					{X=46,Z=93,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=90,Z_MAX=96},
					{X=37,Z=101,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=98,Z_MAX=104},
					{X=46,Z=101,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=98,Z_MAX=104},
					{X=38,Z=109,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=106,Z_MAX=112},
					{X=46,Z=109,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=106,Z_MAX=112},
					{X=37,Z=117,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=114,Z_MAX=120},
					{X=46,Z=117,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=114,Z_MAX=120},
					{X=38,Z=125,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=122,Z_MAX=128},
					{X=46,Z=125,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=122,Z_MAX=128},
					{X=38,Z=134,Scene=71,X_MIN=35,X_MAX=40,Z_MIN=131,Z_MAX=137},
					{X=46,Z=134,Scene=71,X_MIN=43,X_MAX=48,Z_MIN=131,Z_MAX=138},
						{X=264,Z=175,Scene=71,X_MIN=262,X_MAX=266,Z_MIN=172,Z_MAX=178},
						{X=270,Z=175,Scene=71,X_MIN=268,X_MAX=272,Z_MIN=172,Z_MAX=178},
						{X=277,Z=175,Scene=71,X_MIN=275,X_MAX=279,Z_MIN=173,Z_MAX=178},
						{X=287,Z=175,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=172,Z_MAX=178},
						{X=270,Z=183,Scene=71,X_MIN=268,X_MAX=272,Z_MIN=180,Z_MAX=186},
						{X=277,Z=183,Scene=71,X_MIN=275,X_MAX=279,Z_MIN=180,Z_MAX=186},
						{X=287,Z=183,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=180,Z_MAX=186},
						{X=270,Z=192,Scene=71,X_MIN=268,X_MAX=272,Z_MIN=189,Z_MAX=195},
						{X=277,Z=192,Scene=71,X_MIN=275,X_MAX=279,Z_MIN=189,Z_MAX=195},
						{X=287,Z=192,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=189,Z_MAX=195},
						{X=287,Z=200,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=197,Z_MAX=203},
						{X=287,Z=209,Scene=71,X_MIN=285,X_MAX=289,Z_MIN=206,Z_MAX=212},
					{X=134,Z=272,Scene=71,X_MIN=132,X_MAX=136,Z_MIN=269,Z_MAX=274},
					{X=141,Z=272,Scene=71,X_MIN=139,X_MAX=143,Z_MIN=269,Z_MAX=274},
					{X=148,Z=272,Scene=71,X_MIN=146,X_MAX=150,Z_MIN=269,Z_MAX=275},
					{X=173,Z=271,Scene=71,X_MIN=171,X_MAX=175,Z_MIN=268,Z_MAX=274},
					{X=181,Z=271,Scene=71,X_MIN=179,X_MAX=183,Z_MIN=268,Z_MAX=274},
					{X=188,Z=271,Scene=71,X_MIN=186,X_MAX=190,Z_MIN=268,Z_MAX=273},
					{X=134,Z=279,Scene=71,X_MIN=132,X_MAX=136,Z_MIN=276,Z_MAX=281},
					{X=141,Z=279,Scene=71,X_MIN=139,X_MAX=143,Z_MIN=276,Z_MAX=281},
					{X=148,Z=279,Scene=71,X_MIN=146,X_MAX=150,Z_MIN=276,Z_MAX=282},
					{X=173,Z=279,Scene=71,X_MIN=171,X_MAX=175,Z_MIN=276,Z_MAX=281},
					{X=181,Z=279,Scene=71,X_MIN=179,X_MAX=183,Z_MIN=276,Z_MAX=281},
					{X=188,Z=279,Scene=71,X_MIN=186,X_MAX=190,Z_MIN=276,Z_MAX=281},
							{X=37,Z=93,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=90,Z_MAX=96},
							{X=46,Z=93,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=90,Z_MAX=96},
							{X=37,Z=101,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=98,Z_MAX=104},
							{X=46,Z=101,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=98,Z_MAX=104},
							{X=38,Z=109,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=106,Z_MAX=112},
							{X=46,Z=109,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=106,Z_MAX=112},
							{X=37,Z=117,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=114,Z_MAX=120},
							{X=46,Z=117,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=114,Z_MAX=120},
							{X=38,Z=125,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=122,Z_MAX=128},
							{X=46,Z=125,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=122,Z_MAX=128},
							{X=38,Z=134,Scene=72,X_MIN=35,X_MAX=40,Z_MIN=131,Z_MAX=137},
							{X=46,Z=134,Scene=72,X_MIN=43,X_MAX=48,Z_MIN=131,Z_MAX=138},
					{X=264,Z=175,Scene=72,X_MIN=262,X_MAX=266,Z_MIN=172,Z_MAX=178},
					{X=270,Z=175,Scene=72,X_MIN=268,X_MAX=272,Z_MIN=172,Z_MAX=178},
					{X=277,Z=175,Scene=72,X_MIN=275,X_MAX=279,Z_MIN=173,Z_MAX=178},
					{X=287,Z=175,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=172,Z_MAX=178},
					{X=270,Z=183,Scene=72,X_MIN=268,X_MAX=272,Z_MIN=180,Z_MAX=186},
					{X=277,Z=183,Scene=72,X_MIN=275,X_MAX=279,Z_MIN=180,Z_MAX=186},
					{X=287,Z=183,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=180,Z_MAX=186},
					{X=270,Z=192,Scene=72,X_MIN=268,X_MAX=272,Z_MIN=189,Z_MAX=195},
					{X=277,Z=192,Scene=72,X_MIN=275,X_MAX=279,Z_MIN=189,Z_MAX=195},
					{X=287,Z=192,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=189,Z_MAX=195},
					{X=287,Z=200,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=197,Z_MAX=203},
					{X=287,Z=209,Scene=72,X_MIN=285,X_MAX=289,Z_MIN=206,Z_MAX=212},
						{X=134,Z=272,Scene=72,X_MIN=132,X_MAX=136,Z_MIN=269,Z_MAX=274},
						{X=141,Z=272,Scene=72,X_MIN=139,X_MAX=143,Z_MIN=269,Z_MAX=274},
						{X=148,Z=272,Scene=72,X_MIN=146,X_MAX=150,Z_MIN=269,Z_MAX=275},
						{X=173,Z=271,Scene=72,X_MIN=171,X_MAX=175,Z_MIN=268,Z_MAX=274},
						{X=181,Z=271,Scene=72,X_MIN=179,X_MAX=183,Z_MIN=268,Z_MAX=274},
						{X=188,Z=271,Scene=72,X_MIN=186,X_MAX=190,Z_MIN=268,Z_MAX=273},
						{X=134,Z=279,Scene=72,X_MIN=132,X_MAX=136,Z_MIN=276,Z_MAX=281},
						{X=141,Z=279,Scene=72,X_MIN=139,X_MAX=143,Z_MIN=276,Z_MAX=281},
						{X=148,Z=279,Scene=72,X_MIN=146,X_MAX=150,Z_MIN=276,Z_MAX=282},
						{X=173,Z=279,Scene=72,X_MIN=171,X_MAX=175,Z_MIN=276,Z_MAX=281},
						{X=181,Z=279,Scene=72,X_MIN=179,X_MAX=183,Z_MIN=276,Z_MAX=281},
						{X=188,Z=279,Scene=72,X_MIN=186,X_MAX=190,Z_MIN=276,Z_MAX=281},
					-- 楼兰种植点
					{X=35,Z=206,Scene=186,X_MIN=33,X_MAX=37,Z_MIN=203,Z_MAX=208},
					{X=41,Z=206,Scene=186,X_MIN=39,X_MAX=43,Z_MIN=203,Z_MAX=208},
					{X=46,Z=206,Scene=186,X_MIN=43,X_MAX=47,Z_MIN=203,Z_MAX=208},
					{X=51,Z=206,Scene=186,X_MIN=48,X_MAX=52,Z_MIN=203,Z_MAX=208},
					{X=57,Z=206,Scene=186,X_MIN=54,X_MAX=58,Z_MIN=203,Z_MAX=208},
					{X=57,Z=214,Scene=186,X_MIN=55,X_MAX=59,Z_MIN=211,Z_MAX=216},
					{X=51,Z=214,Scene=186,X_MIN=49,X_MAX=53,Z_MIN=211,Z_MAX=216},
					{X=46,Z=214,Scene=186,X_MIN=44,X_MAX=48,Z_MIN=211,Z_MAX=216},
					{X=41,Z=214,Scene=186,X_MIN=39,X_MAX=43,Z_MIN=211,Z_MAX=216},
					{X=35,Z=214,Scene=186,X_MIN=33,X_MAX=37,Z_MIN=211,Z_MAX=216},
					--楼兰新开10块地
					{X=97,Z=197,Scene=186,X_MIN=95,X_MAX=99,Z_MIN=194,Z_MAX=199},
					{X=104,Z=197,Scene=186,X_MIN=102,X_MAX=106,Z_MIN=194,Z_MAX=199},
					{X=97,Z=206,Scene=186,X_MIN=95,X_MAX=99,Z_MIN=203,Z_MAX=208},
					{X=103,Z=206,Scene=186,X_MIN=101,X_MAX=105,Z_MIN=203,Z_MAX=208},
					{X=109,Z=206,Scene=186,X_MIN=107,X_MAX=121,Z_MIN=203,Z_MAX=208},
					{X=96,Z=216,Scene=186,X_MIN=94,X_MAX=98,Z_MIN=213,Z_MAX=218},
					{X=102,Z=216,Scene=186,X_MIN=100,X_MAX=104,Z_MIN=213,Z_MAX=218},
					{X=108,Z=216,Scene=186,X_MIN=106,X_MAX=110,Z_MIN=213,Z_MAX=218},
					{X=96,Z=234,Scene=186,X_MIN=94,X_MAX=98,Z_MIN=231,Z_MAX=236},
					{X=102,Z=234,Scene=186,X_MIN=100,X_MAX=104,Z_MIN=231,Z_MAX=236},
						--束河古镇种植点 zchw
					{X=288,Z= 284,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=283,Z_MAX=287},
  				{X=288,Z= 276,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=275,Z_MAX=279},
  				{X=288,Z= 268,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=267,Z_MAX=271},
 				 	{X=288,Z= 259,Scene=420,X_MIN=287,X_MAX=291,Z_MIN=258,Z_MAX=262},
  				{X=296,Z= 258,Scene=420,X_MIN=295,X_MAX=298,Z_MIN=257,Z_MAX=261},
  				{X=296,Z= 267,Scene=420,X_MIN=295,X_MAX=298,Z_MIN=266,Z_MAX=270},
  				{X=296,Z= 276,Scene=420,X_MIN=295,X_MAX=298,Z_MIN=275,Z_MAX=279}, 
				}
--种植产品在commonitem中的编号
V_ZHONGZHI_ID = {20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010,
				20104011,20104012,20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,
				20105009,20105010,20105011,20105012}
--种植产品的等级
V_ZHONGZHI_NEEDLEVEL = {1,2,3,4,5,6,7,8,9,10,
						11,12,1,2,3,4,5,6,7,8,
						9,10,11,12}
--种植产品的名称
V_ZHONGZHI_NAME = {"早产小麦","早产大米","早产玉米","早产花生","早产红薯","早产高粱","早产芝麻","早产绿豆","早产黄豆","早产蚕豆",
					"早产马铃薯","早产芋头","早产苎麻","早产草棉","早产亚麻","早产木棉","早产黄麻","早产云棉","早产槿麻","早产绒棉",
					"早产青麻","早产彩棉","早产罗布麻","早产陆地棉",
					"晚产小麦","晚产大米","晚产玉米","晚产花生","晚产红薯","晚产高粱","晚产芝麻","晚产绿豆","晚产黄豆","晚产蚕豆",
					"晚产马铃薯","晚产芋头","晚产苎麻","晚产草棉","晚产亚麻","晚产木棉","晚产黄麻","晚产云棉","晚产槿麻","晚产绒棉",
					"晚产青麻","晚产彩棉","晚产罗布麻","晚产陆地棉"}
--种植时放入的幼苗生长点在growpoint.txt中的编号
V_ZHONGZHI_ITEMBOX_ID = {501,504,507,510,513,516,519,522,525,528,
					531,534,537,540,543,546,549,552,555,558,
					561,564,567,570,
					701,704,707,710,713,716,719,722,725,728,
					731,734,737,740,743,746,749,752,755,758,
					761,764,767,770}

--randomseed(mytime());

--门派ID号宏定义
MP_SHAOLIN  = 0
MP_MINGJIAO = 1
MP_GAIBANG  = 2
MP_WUDANG   = 3
MP_EMEI     = 4
MP_XINGSU   = 5
MP_DALI     = 6
MP_TIANSHAN = 7
MP_XIAOYAO  = 8
MP_WUMENPAI = 9

--门派的师门脚本ID....
MENPAI_SHIMEN_SCRIPTID = {
	229000,
	229001,
	229008,
	229002,
	229003,
	229007,
	229004,
	229006,
	229005,
}

--门派的师门任务号....
MENPAI_SHIMEN_MISID = {
	1060,
	1070,
	1065,
	1075,
	1090,
	1095,
	1080,
	1100,
	1085,
}


--场景数量宏定义
SCENE_NUMBER  = 42

--场景名称宏定义
SCENE_NAME ={ "洛阳", "苏州", "大理", "嵩山", "太湖", "镜湖", "无量山","剑阁","敦煌","少林寺","丐帮总舵","光明殿","武当山", "天龙寺", "淩波洞", "峨嵋山", "星宿海", "天山", "雁南", "雁北", "草原", "辽西", "长白山", "黄龙府", "苍山", "洱海", "石林", "玉溪", "南诏", "苗疆", "西湖", "龙泉", "武夷", "梅岭", "南海", "琼州", "聚贤庄", "燕子坞", "一品堂", "预留1", "预留2", "预留3"}

--*******************************************************************************
--洛阳送信赚钱任务目标npc的场景号,坐标,对应任务脚本,名称
--*******************************************************************************
MISSION_LUOYANG_SENDMAIL ={{X=216,Z=135,SCENE=0,SCRIPT=250501,TIP="严百草"},
							{X=138,Z=164,SCENE=2,SCRIPT=250502,TIP="张明景"}
						}

MISSION_4006=4006
MISSION_4007=4007
MISSION_4008=4008
MISSION_4009=4009
MISSION_4013=4013
MISSION_4022=4022
MISSION_4028=4028
MISSION_546=546
MISSION_564=564
MISSION_561=561

--*******************************************************************************
--定义Msg2player中最后一个变量,表示聊天窗口的提示文字前没有别的文字
--*******************************************************************************
MSG2PLAYER_PARA=8

--*******************************************************************************
--可执行邮件 param0 的可能值
--*******************************************************************************
MAIL_REPUDIATE				= 1			--强制离婚
MAIL_BETRAYMASTER			= 2			--叛师
MAIL_EXPELPRENTICE			= 3			--开除徒弟
MAIL_UPDATE_ATTR			= 4			--属性刷新
MAIL_UNSWEAR				= 5			--解除结拜
MAIL_PRENTICE_EXP			= 6			--徒弟给师傅经验
MAIL_COMMISIONSHOP			= 7			--寄售商店邮件
MAIL_HUASHANJIANGLI			=	8			--华山论剑奖励相关
MAIL_SHITUPRIZE				= 9				--徒弟给师父抽奖机会
MAIL_SHITUPRIZE_GOODBAD = 10		--奖励经验和善恶值
MIAL_SHITU_CHUSHI		= 11				--45级出师 
MAIL_FINDFRIEND_DELINFO = 12        --征友系统，玩家主动或者系统撤销了玩家发布的信息

--*******************************************************************************
--配方用宏定义
--*******************************************************************************
USERECIPE_SCRIPT	= 713501			--使用配方的脚本编号

--*******************************************************************************
--生活技能
--*******************************************************************************

ABILITY_PENGREN	= 1		--烹饪技能对应编号
ABILITY_ZHIYAO	= 2		--制药技能对应编号
ABILITY_XIANGQIAN	= 3		--镶嵌技能对应编号
ABILITY_ZHUZAO= 4		--铸造技能对应编号
ABILITY_FENGREN	= 5		--缝纫技能对应编号
ABILITY_GONGYI	= 6		--工艺制作技能对应编号
ABILITY_CAIKUANG	= 7		--采矿技能对应编号
ABILITY_CAIYAO	= 8		--采药技能对应编号
ABILITY_DIAOYU	= 9		--钓鱼技能对应编号
ABILITY_ZHONGZHI	= 10		--种植技能对应编号
ABILITY_KAIGUANG	= 11		--开光技能对应编号
ABILITY_SHENGHUOSHU	= 12		--圣火术技能对应编号
ABILITY_NIANGJIU	= 13		--酿酒技能对应编号
ABILITY_XUANBINGSHU	= 14		--玄冰术技能对应编号
ABILITY_ZHIGU	= 15		--制蛊技能对应编号
ABILITY_ZHIDU	= 16		--制毒技能对应编号
ABILITY_ZHIFU	= 17		--制符技能对应编号
ABILITY_LIANDAN	= 18		--炼丹技能对应编号
ABILITY_QIMENDUNJIA	= 19		--奇门遁甲技能对应编号
ABILITY_GONGCHENGXUE	= 20		--工程学技能对应编号
ABILITY_QUGUI	= 21		--驱鬼技能对应编号
ABILITY_WABAO	= 22		--挖宝技能对应编号
ABILITY_PAOSHANG	= 23		--跑商技能对应编号
ABILITY_SHAJIA	= 24		--杀价技能对应编号
ABILITY_REMAI	= 25		--热卖技能对应编号
ABILITY_CAOZUOZHONG	= 26		--操作中技能对应编号
ABILITY_YAOLI = 27		--药理技能对应编号
ABILITY_YANGSHENGFA = 28 --养生法
ABILITY_FOFA = 29	--佛法					少林 用于辅助	开光
ABILITY_CAIHUOSHU = 30	--采火术			明教 用于辅助	圣火术
ABILITY_LIANHUALUO = 31	--莲花落			丐帮 用于辅助	酿酒
ABILITY_CAIBINGSHU = 32	--采冰术			天山 用于辅助	玄冰术
ABILITY_JINGMAIBAIJUE = 33	--经脉百决		大理 用于辅助	制蛊
ABILITY_YINCHONGSHU = 34	--引虫术		星宿 用于辅助	制毒
ABILITY_LINGXINSHU = 35	--灵心术			峨嵋 用于辅助	制符
ABILITY_DAOFA = 36	--道法					武当 用于辅助	炼丹
ABILITY_LIUYIFENGGU = 37	--六艺风骨		逍遥 用于辅助	奇门遁甲
ABILITY_QISHU	= 38	--骑术
ABILITY_GPS	= 39	--定位符
ABILITY_HUOXUE	= 40	--活血
ABILITY_YANGQI	= 41	--养气
ABILITY_QIANGSHEN	=	42	--强身
ABILITY_JIANTI	=	43	--健体
ABILITY_XIUSHEN	=	44	--修身
ABILITY_SUTI	=	45	--塑体
ABILITY_CAILIAOHECHENG = 49	--材料合成	材料合成

--*******************************************************************************
--城市生活技能详细信息，生活技能的名称，生活技能的脚本号，对应的函数名称
--yangjun 主要是为了兼容已有的旧生活技能脚本而存在的
--*******************************************************************************
--下标			生活技能ID
--aname			这个生活技能的名称
--script		这个生活技能的脚本号(学习,升级,了解)

CITY_ABILITY_DETAIL	=	{
	--新生活技能
	[ABILITY_HUOXUE]	=	{aname="活血",script={713622,713622,713622}},
	[ABILITY_YANGQI]	=	{aname="养气",script={713623,713623,713623}},
	[ABILITY_QIANGSHEN]	=	{aname="强身",script={713624,713624,713624}},
	[ABILITY_JIANTI]	=	{aname="健体",script={713625,713625,713625}},
	[ABILITY_XIUSHEN]	=	{aname="修身",script={713626,713626,713626}},
	[ABILITY_SUTI]		=	{aname="塑体",script={713627,713627,713627}},
	--原来就有的生活技能
	[ABILITY_ZHUZAO]	=	{aname="铸造",script={713505,713564,713604}},
	[ABILITY_FENGREN]	=	{aname="缝纫",script={713506,713565,713605}},
	[ABILITY_CAIKUANG]	=	{aname="采矿",script={713508,713567,713607}},
	[ABILITY_GONGYI]	=	{aname="工艺",script={713507,713566,713606}},
	--[ABILITY_XIANGQIAN]	=	{aname="镶嵌",script={713504,713563,713603}},
	[ABILITY_ZHONGZHI]	=	{aname="种植",script={713511,713570,713610}},
	[ABILITY_CAIYAO]	=	{aname="采药",script={713509,713568,713608}},
	[ABILITY_DIAOYU]	=	{aname="钓鱼",script={713510,713569,713609}},
--	[ABILITY_PAOSHANG]	=	{aname="跑商",script={,,}},
--	[ABILITY_GONGCHENGXUE]	=	{aname="工程学",script={,,}},
	[ABILITY_PENGREN]	=	{aname="烹饪",script={-1,713561,713601}},
	[ABILITY_YANGSHENGFA]	=	{aname="养生",script={713528,713587,713621}},
	[ABILITY_ZHIYAO]	=	{aname="制药",script={713503,713562,713602}},
	[ABILITY_YAOLI]	=	{aname="药理",script={713527,713586,713620}},
}

--*******************************************************************************
--城市建筑物相关
--*******************************************************************************
CITY_BUILDING_XIANYA			= 0			--县衙0
CITY_BUILDING_XIANGFANG		= 1     --厢房1
CITY_BUILDING_JIUSI				= 2     --酒肆2
CITY_BUILDING_QIANZHUANG	= 3     --钱庄3
CITY_BUILDING_FANGJUFANG	= 4     --防具4
CITY_BUILDING_DUANTAI			= 5     --锻台5
CITY_BUILDING_WUJUFANG		= 6     --武具6
CITY_BUILDING_MICANG			= 7     --米仓7
CITY_BUILDING_CHENGQIANG	= 8     --城墙8
CITY_BUILDING_JIFANG			= 9     --集仿9
CITY_BUILDING_YISHE				= 10    --医舍10
CITY_BUILDING_WUFANG			= 11    --武仿11
CITY_BUILDING_JIANTA			= 12    --箭塔12
CITY_BUILDING_SHUFANG			= 13    --书房13
CITY_BUILDING_QIJI				= 14    --奇迹14
CITY_BUILDING_XIAOCHANG		= 15    --校场15
CITY_BUILDING_HUOBINGTA		= 16    --火冰塔16
CITY_BUILDING_DAQI				= 17    --大旗17

CITY_IND_RATE		= 0		--工业率0
CITY_AGR_RATE		=	1   --农业率1
CITY_COM_RATE		=	2   --商业率2
CITY_DEF_RATE		=	3   --防卫率3
CITY_TECH_RATE	=	4   --科技率4
CITY_AMBI_RATE	=	5   --扩张率5

--*******************************************************************************
--城市建筑物及六率值对应表
--*******************************************************************************
CITY_BUILDING_SIXRATE = {
					[CITY_BUILDING_XIANYA]			= CITY_AMBI_RATE,
					[CITY_BUILDING_XIANGFANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_JIUSI]       = CITY_AMBI_RATE,
					[CITY_BUILDING_QIANZHUANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_FANGJUFANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_DUANTAI]     = CITY_AMBI_RATE,
					[CITY_BUILDING_WUJUFANG]    = CITY_AMBI_RATE,
					[CITY_BUILDING_MICANG]      = CITY_AMBI_RATE,
					[CITY_BUILDING_CHENGQIANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_JIFANG]      = CITY_AMBI_RATE,
					[CITY_BUILDING_YISHE]       = CITY_AMBI_RATE,
					[CITY_BUILDING_WUFANG]      = CITY_AMBI_RATE,
					[CITY_BUILDING_JIANTA]      = CITY_AMBI_RATE,
					[CITY_BUILDING_SHUFANG]     = CITY_AMBI_RATE,
					[CITY_BUILDING_QIJI]        = CITY_AMBI_RATE,
					[CITY_BUILDING_XIAOCHANG]   = CITY_AMBI_RATE,
					[CITY_BUILDING_HUOBINGTA]   = CITY_AMBI_RATE,
					[CITY_BUILDING_DAQI]	      = CITY_AMBI_RATE,
}

--*******************************************************************************
--城市建筑物可学习生活技能表
--*******************************************************************************
CITY_BUILDING_ABILITY_LIST = {
					--[CITY_BUILDING_SHUFANG]		= {ABILITY_XIUSHEN,ABILITY_SUTI},
					[CITY_BUILDING_DUANTAI]		= {ABILITY_ZHUZAO,ABILITY_FENGREN,ABILITY_CAIKUANG,ABILITY_GONGYI},
					[CITY_BUILDING_MICANG]		= {ABILITY_ZHONGZHI,ABILITY_CAIYAO,ABILITY_HUOXUE},
					[CITY_BUILDING_JIFANG]		=	{ABILITY_DIAOYU,ABILITY_YANGQI},
					[CITY_BUILDING_JIUSI]			=	{ABILITY_PENGREN,ABILITY_YANGSHENGFA},
					[CITY_BUILDING_YISHE]			=	{ABILITY_ZHIYAO,ABILITY_YAOLI},
					[CITY_BUILDING_QIANZHUANG]=	{ABILITY_QIANGSHEN,ABILITY_JIANTI},
}

--*******************************************************************************
--城市建筑物学习与升级生活技能的条件配置表
--CITY_BUILDING_ABILITY_RULE[建筑ID][建筑等级] = {aid=技能ID,amin=可学最小等级,amax=可学最大等级}
--*******************************************************************************
CITY_BUILDING_ABILITY_RULE = {}
CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_SHUFANG]	= {
					[2] = {
										{aid=ABILITY_XIUSHEN,			amin=0,		amax=30},
										{aid=ABILITY_SUTI,				amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_XIUSHEN,			amin=0,		amax=60},
										{aid=ABILITY_SUTI,				amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_XIUSHEN,			amin=0,		amax=100},
										{aid=ABILITY_SUTI,				amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_DUANTAI]		= {
					[0] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=6},
										{aid=ABILITY_FENGREN,			amin=0,		amax=6},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=6},
										{aid=ABILITY_GONGYI,			amin=0,		amax=6},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=6},
					},
					[1] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=7},
										{aid=ABILITY_FENGREN,			amin=0,		amax=7},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=7},
										{aid=ABILITY_GONGYI,			amin=0,		amax=7},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=7},
					},
					[2] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=8},
										{aid=ABILITY_FENGREN,			amin=0,		amax=8},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=8},
										{aid=ABILITY_GONGYI,			amin=0,		amax=8},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=8},
					},
					[3] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=9},
										{aid=ABILITY_FENGREN,			amin=0,		amax=9},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=9},
										{aid=ABILITY_GONGYI,			amin=0,		amax=9},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=9},
					},
					[4] = {
										{aid=ABILITY_ZHUZAO,			amin=0,		amax=10},
										{aid=ABILITY_FENGREN,			amin=0,		amax=10},
										{aid=ABILITY_CAIKUANG,		amin=0,		amax=10},
										{aid=ABILITY_GONGYI,			amin=0,		amax=10},
--										{aid=ABILITY_XIANGQIAN,		amin=0,		amax=10},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_MICANG]		= {
					[0] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=6},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=6},
					},
					[1] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=7},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=7},
					},
					[2] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=8},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=8},
										{aid=ABILITY_HUOXUE,			amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=9},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=9},
										{aid=ABILITY_HUOXUE,			amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_ZHONGZHI,		amin=0,		amax=10},
										{aid=ABILITY_CAIYAO,			amin=0,		amax=10},
										{aid=ABILITY_HUOXUE,			amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_JIFANG]		=	{
					[0] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=6},
					},
					[1] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=7},
					},
					[2] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=8},
										{aid=ABILITY_YANGQI,			amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=9},
										{aid=ABILITY_YANGQI,			amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_DIAOYU,			amin=0,		amax=10},
										{aid=ABILITY_YANGQI,			amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_JIUSI]			=	{
					[1] = {
										{aid=ABILITY_PENGREN,			amin=0,		amax=7},
										{aid=ABILITY_YANGSHENGFA,	amin=0,		amax=50},
					},
					[2] = {
										{aid=ABILITY_PENGREN,			amin=0,		amax=9},
										{aid=ABILITY_YANGSHENGFA,	amin=0,		amax=70},
					},
					[3] = {
										{aid=ABILITY_PENGREN,			amin=0,		amax=10},
										{aid=ABILITY_YANGSHENGFA,	amin=0,		amax=99},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_YISHE]			=	{
					[1] = {
										{aid=ABILITY_ZHIYAO,			amin=0,		amax=7},
										{aid=ABILITY_YAOLI,				amin=0,		amax=50},
					},
					[2] = {
										{aid=ABILITY_ZHIYAO,			amin=0,		amax=9},
										{aid=ABILITY_YAOLI,				amin=0,		amax=70},
					},
					[3] = {
										{aid=ABILITY_ZHIYAO,			amin=0,		amax=10},
										{aid=ABILITY_YAOLI,				amin=0,		amax=99},
					},
}

CITY_BUILDING_ABILITY_RULE[CITY_BUILDING_QIANZHUANG]=	{
					[2] = {
										{aid=ABILITY_QIANGSHEN,		amin=0,		amax=30},
										{aid=ABILITY_JIANTI,			amin=0,		amax=30},
					},
					[3] = {
										{aid=ABILITY_QIANGSHEN,		amin=0,		amax=60},
										{aid=ABILITY_JIANTI,			amin=0,		amax=60},
					},
					[4] = {
										{aid=ABILITY_QIANGSHEN,		amin=0,		amax=100},
										{aid=ABILITY_JIANTI,			amin=0,		amax=100},
					},
}

CITY_BUILDING_ABILITY_SCRIPT	=	600022
--*******************************************************************************
--合成材料以及产品分类
--*******************************************************************************
ZHIYAO_CAILIAO1 = 1
ZHIYAO_CAILIAO2 = 2
ZHIYAO_CAILIAO3 = 3
ZHIYAO_CAILIAO4 = 4
ZHIYAO_CAILIAO5 = 5
ZHIYAO_CAILIAO6 = 6
ZHIYAO_CAILIAO7 = 7
ZHIYAO_CAILIAO8 = 8
ZHIYAO_CAILIAO9 = 9
ZHIYAO_CAILIAO10 = 10

ZHIYAO_CHANPIN1 = 1
ZHIYAO_CHANPIN2 = 2
ZHIYAO_CHANPIN3 = 3
ZHIYAO_CHANPIN4 = 4
ZHIYAO_CHANPIN5 = 5
ZHIYAO_CHANPIN6 = 6
ZHIYAO_CHANPIN7 = 7
ZHIYAO_CHANPIN8 = 8
ZHIYAO_CHANPIN9 = 9
ZHIYAO_CHANPIN10 = 10

ZHIYAO_CHANPINCHUJI = 11
ZHIYAO_CHANPINZHONGJI = 12
ZHIYAO_CHANPINGAOJI = 13

PENGREN_CAILIAO_GUWU1 = 11
PENGREN_CAILIAO_GUWU2 = 12
PENGREN_CAILIAO_GUWU3 = 13
PENGREN_CAILIAO_GUWU4 = 14
PENGREN_CAILIAO_GUWU5 = 15
PENGREN_CAILIAO_GUWU6 = 16
PENGREN_CAILIAO_GUWU7 = 17
PENGREN_CAILIAO_GUWU8 = 18
PENGREN_CAILIAO_GUWU9 = 19
PENGREN_CAILIAO_GUWU10 = 20

PENGREN_CHANPIN_GUWU1 = 14
PENGREN_CHANPIN_GUWU2 = 15
PENGREN_CHANPIN_GUWU3 = 16
PENGREN_CHANPIN_GUWU4 = 17
PENGREN_CHANPIN_GUWU5 = 18
PENGREN_CHANPIN_GUWU6 = 19
PENGREN_CHANPIN_GUWU7 = 20
PENGREN_CHANPIN_GUWU8 = 21
PENGREN_CHANPIN_GUWU9 = 22
PENGREN_CHANPIN_GUWU10 = 23

PENGREN_CHANPIN_GUWUCHUJI = 24
PENGREN_CHANPIN_GUWUZHONGJI = 25
PENGREN_CHANPIN_GUWUGAOJI = 26

PENGREN_CAILIAO_ZAWU1 = 21
PENGREN_CAILIAO_ZAWU2 = 22
PENGREN_CAILIAO_ZAWU3 = 23
PENGREN_CAILIAO_ZAWU4 = 24
PENGREN_CAILIAO_ZAWU5 = 25
PENGREN_CAILIAO_ZAWU6 = 26
PENGREN_CAILIAO_ZAWU7 = 27
PENGREN_CAILIAO_ZAWU8 = 28
PENGREN_CAILIAO_ZAWU9 = 29
PENGREN_CAILIAO_ZAWU10 = 30

PENGREN_CHANPIN_ZAWU1 = 27
PENGREN_CHANPIN_ZAWU2 = 28
PENGREN_CHANPIN_ZAWU3 = 29
PENGREN_CHANPIN_ZAWU4 = 30
PENGREN_CHANPIN_ZAWU5 = 31
PENGREN_CHANPIN_ZAWU6 = 32
PENGREN_CHANPIN_ZAWU7 = 33
PENGREN_CHANPIN_ZAWU8 = 34
PENGREN_CHANPIN_ZAWU9 = 35
PENGREN_CHANPIN_ZAWU10 = 36

PENGREN_CHANPIN_ZAWUCHUJI = 37
PENGREN_CHANPIN_ZAWUZHONGJI = 38
PENGREN_CHANPIN_ZAWUGAOJI = 39

--*******************************************************************************
--生活技能使用相关
--*******************************************************************************
--Vigor  活力   Energy   精力
--CONSUME_ABILITY_CAIYAO={{Vigor=10,Energy=0},
--						{Vigor=20,Energy=0},
--						{Vigor=30,Energy=0},
--						{Vigor=40,Energy=0},
--						{Vigor=50,Energy=0},
--						{Vigor=60,Energy=0},
--						{Vigor=70,Energy=0},
--						{Vigor=80,Energy=0},
--						{Vigor=90,Energy=0},
--						{Vigor=100,Energy=0},
--						{Vigor=110,Energy=0},
--						{Vigor=120,Energy=0},
--						}

--*******************************************************************************
--ABILITYLOGIC
--*******************************************************************************
ABILITYLOGIC_ID = 701601


--*******************************************************************************
--MissionData中各个数据的定义
--*******************************************************************************
MD_PINPAN_DAYCOUNT			= 0		--100000的倍数是当前完成的环数，小于100000的数是时间
MD_PINPAN_HUAN				= 1		--平叛
MD_WABAO_DAYCOUNT			= 2		--100000的倍数是当前完成的环数，小于100000的数是时间
MD_WABAO_HUAN				= 3		--挖宝
MD_BAIMASI_DAYCOUNT			= 4		--年虫问题修复，此位置只存储白马寺任务环数 modified by zhangguoxin 090207
MD_BAIMASI_HUAN				= 5		--白马寺
MD_SHUILAO_DAYCOUNT			= 6		--100000的倍数是当前完成的环数，小于100000的数是时间
MD_SHUILAO_HUAN				= 7		--水牢
MD_MURENXIANG_DAYCOUNT			= 8		--100000的倍数是当前完成的环数，小于100000的数是时间
MD_MURENXIANG_HUAN			= 9		--木人巷
MD_WENDA_DAYCOUNT			=10		--100000的倍数是当前完成的环数，小于100000的数是时间
MD_WENDA_HUAN				=11		--问答
MD_LINGLONG_DAYCOUNT			=12		--100000的倍数是当前完成的环数，小于100000的数是时间
MD_LINGLONG_HUAN			=13		--玲珑
MD_CAOYUN_DAYCOUNT			=14		--年虫问题修复，此位置只存储漕运任务环数 modified by zhangguoxin 090207
MD_CAOYUN_HUAN				=15		--漕运
MD_SHIMEN_DAYCOUNT			=16		--年虫问题修复，此位置只存储师门任务次数 modified by zhangguoxin 090208
MD_SHIMEN_HUAN				=17		--九大门派师门任务
MD_GAME_FLAG0				=18		-- 游戏标记位
MD_GAME_FLAG1				=19		-- 游戏标记位
MD_GAME_FLAG2				=20		-- 游戏标记位
MD_GAME_FLAG3				=21		-- 游戏标记位
MD_GAME_FLAG4				=22		-- 游戏标记位
MD_GAME_FLAG5				=23		-- 游戏标记位
MD_GAME_FLAG6				=24		-- 游戏标记位
MD_GAME_FLAG7				=25		-- 游戏标记位
MD_GAME_FLAG8				=26		-- 游戏标记位
MD_GAME_FLAG9				=27		-- 游戏标记位
MD_TIAOZHAN_SCRIPT			=28		--擂台挑战副本脚本号
MD_ZHONGZHI_TIME			=29		--设置种植的时间，避免一个玩家同时种太多土地
MD_FASONGTONGZHI_HUAN			=30		--发送通知的环数
MD_PREV_CAMP				=31		--阵营号缓存，目前仅用于进入擂台是缓存进入前的阵营号
MD_CATCH_PET				=32		--洛阳捉珍兽任务，记录环数
MD_SEND_MAIL				=33		--洛阳送信任务，记录环数
MD_RENWULIAN_DAYCOUNT			=34		--任务链 100000的倍数是当前完成的环数，小于100000的数是时间
MD_RENWULIAN_HUAN			=35		--任务链的环数
MD_CAOYUN_MONSTERTIMER			=36		--漕运的怪物出现次数
MD_QUIZ_DAYCOUNT			=37		--智力问答每天做的次数，100000的倍数是当前完成的环数，小于100000的数是时间
MD_CITY_ENGINEERING_ROUND		=38		--城市内政工程任务
MD_CITY_ENGINEERING_TIME		=39		--城市内政工程任务放弃任务的时间
MD_CITY_DEVELOPMENT_ROUND		=40		--城市内政发展任务
MD_CITY_DEVELOPMENT_TIME		=41		--城市内政发展任务放弃任务的时间
MD_CITY_SCITECH_ROUND			=42		--城市内政科技任务
MD_CITY_SCITECH_TIME			=43		--城市内政科技任务放弃任务的时间
MD_CITY_MARKET_ROUND			=44		--城市内政市集任务
MD_CITY_MARKET_TIME			=45		--城市内政市集任务放弃任务的时间
MD_FASONGTONGZHI_DAYCOUNT		=46		--年虫问题修复，此位置只存储发送通知次数 modified by zhangguoxin 090207
MD_CAPTUREPETABANDON_TIME		=47		--捕捉珍兽放弃时间。Steven.Han 2006-8-15 14:18
MD_SHIMEN_DOUBLE_EXP			=48		--师门是否为双倍经验的标识
MD_CHENGXIONGDATU_DAYCOUNT		=49		--年虫问题修复，此位置只存储逞凶打图次数 modified by zhangguoxin 090208
MD_CAOYUN_SUMTIME			=50		--漕运的总次数
MD_CAOYUN_BARGAINUP			=51		--漕运的抬价时间
MD_CAOYUN_BARGAINDOWN			=52		--漕运的杀价时间
MD_QUIZ_ASKTIME				=53		--智力问答提问的时间
MD_MIDAUTUMN_SCORE			=54		--中秋积分
MD_CITY_EXPAND_ROUND			=55		--城市内政扩张任务
MD_RENWULIAN_ACCPETTIME			=56 		--任务链的接收时间
MD_STOPWATCH_PAUSE_FLAG			=57
MD_CITY_EXPAND_TIME			=58		--城市内政扩张任务放弃任务的时间
MD_CITY_CONSTRUCT_ROUND			=59		--城市内政建设任务
MD_CITY_CONSTRUCT_TIME			=60		--城市内政建设任务放弃任务的时间
MD_CITY_RESEARCH_ROUND			=61		--城市内政研究任务
MD_CITY_RESEARCH_TIME			=62		--城市内政研究任务放弃任务的时间
MD_ThiefSoldierInvade			=63		--贼兵入侵积分
MD_FUBENPARAM0				=64 		-- 副本参数1
MD_FUBENPARAM1				=65 		-- 副本参数2
MD_FUBENPARAM2				=66 		-- 副本参数3
MD_FUBENPARAM3				=67 		-- 副本参数4
MD_FUBENPARAM4				=68 		-- 副本参数5
MD_FUBENPARAM5				=69 		-- 副本参数6
MD_FUBENPARAM6				=70 		-- 副本参数7
MD_FUBENPARAM7				=71 		-- 副本参数8
MD_EXAM_TARGETID			=72			-- 科举系统点击的NPC ID
MD_EXAM_STARTTIME			=73			-- 科举系统的开始时间
MD_EXAM_SEQUENCE			=74			-- 科举系统的题的次序
MD_EXAM_ASKTIME				=75			-- 科举系统的提问时间
MD_EXAM_FLAG					=76			-- 科举系统的标记
MD_ZHONGZHI_FLAG			=77		--设置种植的标记，他是种早产还是种晚产
MD_LAST_QIJU_DAY			=78		--棋局活动的最后日期
MD_CITY_MILITARY_ROUND	= 79	-- 城市内政国防任务
MD_CITY_MILITARY_TIME		= 80	-- 城市内政国防任务放弃任务的时间
MD_DATAOSHA_ROUND				= 81	-- 大逃杀的比武回合数
MD_DATAOSHA_RESULT			= 82	-- 大逃杀的比武结果
MD_EXAM_FEE_FLAG			=83			--科举的是否缴费的标记
MD_CAOYUN_TARGETID		=84			--漕运点击的NPC记录
MD_EXAM_BRIBE_FLAG		=85			--科举是否贿赂的标记
MD_EXAM_FIGHT_FLAG		=86			--科举是否副本的标记
MD_BUCHANG_MONEY      =87     --删档补偿是否领了钱
MD_BUCHANG_STONE      =88     --删档补偿是否领了石头
MD_BUCHANG_EQUIP       =89     --删档补偿是否领了装备
MD_EXAM_QUESTION       =90     --科举中，当前问题是哪个。
MD_RELATION_ABANDON			= 91		-- 关系任务放弃后的限制时间
MD_RELATION_MUWANQING		= 92		-- 木婉清任务
MD_RELATION_ZHONGLING		= 93		-- 钟灵任务
MD_RELATION_DUANYANQING		= 94		-- 段延庆任务
MD_RELATION_DUANYU			= 95		-- 段誉任务
MD_RELATION_AZHU			= 96		-- 阿朱任务
MD_RELATION_ABI				= 97		-- 阿碧任务
MD_RELATION_WANGYUYAN		= 98		-- 王语嫣任务
MD_RELATION_XIAOFENG		= 99		-- 萧峰任务
MD_RELATION_AZI				= 100		-- 阿紫任务
MD_RELATION_MURONGFU		= 101		-- 慕容复任务
MD_RELATION_XUZHU			= 102		-- 虚竹任务
MD_RELATION_JIUMOZHI		= 103		-- 鸠摩智任务
MD_RELATION_YINCHUAN		= 104		-- 银川公主任务
MD_QUIZ_TARGET  	     =105     --智力问答中，点的NPC的ID
MD_MENPAI_BOUNTY  	     =106     --门派奖励的标记
MD_MILITARY_ROND_POSITION = 107 --国防任务需要的
MD_RENWULIAN_HONGYUN_LASTTIME = 108 --任务链的鸿运掉落的时间控制数据
MD_FAVOROFGUILD_LASTTIME = 109 --上次领取帮派关怀的时间
MD_MENPAI_BOUNTY_SHIZHUANG		=110     --门派时装每个人只能领取1次
MD_RENWULIAN_EXCHANGEITEM = 111 --任务链用善恶值兑换物品的时间限制

MD_EXCHANGE_MIJIORYAOJUE		=112     --是否已经领取秘籍和要诀

MD_ROUNDMISSION1			= 113		-- 一个也不能跑再也不能随便放弃啦~！
MD_CIRCUS_DAYCOUNT			= 114		--马戏团：100000的倍数是当前完成的环数，小于100000的数是时间

MD_ROUNDMISSION2			= 115		-- 任务放弃后的冷却时间,任务(除害)再也不能随便放弃啦~！
MD_ROUNDMISSION3			= 116		-- 任务放弃后的冷却时间,任务(剿匪)再也不能随便放弃啦~！
MD_NPC_DELMISSION           = 117       --不能随便在NPC那删除任务啦~！明天才能再次删除.

MD_JU_XUNHUAN_MUWANQING		= 118
MD_JU_XUNHUAN_MUWANQING_1		= 119
MD_JU_XUNHUAN_ZHONGLING		= 120
MD_JU_XUNHUAN_ZHONGLING_1		= 121
MD_JU_XUNHUAN_DUANYANQING	= 122
MD_JU_XUNHUAN_DUANYANQING_1	= 123
MD_JU_XUNHUAN_DUANYU			= 124
MD_JU_XUNHUAN_DUANYU_1			= 125
MD_JU_XUNHUAN_AZHU			  = 126
MD_JU_XUNHUAN_AZHU_1			  = 127
MD_JU_XUNHUAN_ABI				  = 128
MD_JU_XUNHUAN_ABI_1				  = 129
MD_JU_XUNHUAN_WANGYUYAN		= 130
MD_JU_XUNHUAN_WANGYUYAN_1		= 131
MD_JU_XUNHUAN_XIAOFENG		= 132
MD_JU_XUNHUAN_XIAOFENG_1		= 133
MD_JU_XUNHUAN_AZI				  = 134
MD_JU_XUNHUAN_AZI_1				  = 135
MD_JU_XUNHUAN_MURONGFU		= 136
MD_JU_XUNHUAN_MURONGFU_1		= 137
MD_JU_XUNHUAN_XUZHU			  = 138
MD_JU_XUNHUAN_XUZHU_1			  = 139
MD_JU_XUNHUAN_JIUMOZHI		= 140
MD_JU_XUNHUAN_JIUMOZHI_1		= 141
MD_JU_XUNHUAN_YINCHUAN		= 142
MD_JU_XUNHUAN_YINCHUAN_1		= 143
MD_GUILDTICKET_TAKENTIMES	= 144		-- 帮派银票一天领取的次数
MD_GUILD_MIS_COUNT_TODAY	= 145  			--今天做的帮派任务的次数
MD_PRE_GUILD_MIS_TIME     = 146				--上一次完成帮派任务的时间

MD_ROUNDMISSION1_TIMES		= 147		-- 一个也不能跑每天接取的次数
MD_ROUNDMISSION2_TIMES		= 148		-- 除害每天接取的次数
MD_ROUNDMISSION3_TIMES		= 149		-- 剿匪每天接取的次数

MD_KILL_CAOYUN_PAOSHANG_CT = 150  -- 一天时间里头打劫商人和漕运人的次数
MD_KILL_CAOYUN_PAOSHANG_PRE_TIME = 151 --上一次打劫时间

-- 每个NPC的剧情循环任务，每日最多可以做50次。
MD_JQXH_MUWANQING_LIMITI			= 152		-- 100000的倍数是当前完成的环数，小于100000的数是时间
MD_JQXH_ZHONGLING_LIMITI			= 153		-- 同上
MD_JQXH_DUANYANQING_LIMITI		= 154		-- 同上
MD_JQXH_DUANYU_LIMITI					= 155		-- 同上
MD_JQXH_AZHU_LIMITI				  	= 156		-- 同上
MD_JQXH_ABI_LIMITI					  = 157		-- 同上
MD_JQXH_WANGYUYAN_LIMITI			= 158		-- 同上
MD_JQXH_XIAOFENG_LIMITI				= 159		-- 同上
MD_JQXH_AZI_LIMITI					  = 160		-- 同上
MD_JQXH_MURONGFU_LIMITI				= 161		-- 同上
MD_JQXH_XUZHU_LIMITI				  = 162		-- 同上
MD_JQXH_JIUMOZHI_LIMITI				= 163		-- 同上
MD_JQXH_YINCHUAN_LIMITI				= 164		-- 同上

MD_RELATION_QIANHONGYU		= 165		-- 跟钱宏宇的关系值
MD_CAOYUN_COMPLETE_TIME		= 166		-- 漕运完成次数时间
MD_DRAWPAY_TIME				= 167		-- 领取工资时间
MD_SALARY_PAYTIME			= 168		-- 封测服务器工资发放时间
MD_YUANBAO_PRIZE_GEM_COUNT	= 169		-- 元宝奖励宝石次数
MD_JIAOFEI_TIMES			= 170   -- 每天的剿匪次数，记录时间和次数
MD_JIAOFEI_PRE_TIME			= 171   -- 每天的剿匪次数，记录时间和次数
MD_TDZ_TIME						= 172		-- 使用药物土遁珠的一些需要的数据，郁闷中，放这里了
MD_TDZ_SCENE					= 173
MD_TDZ_X							= 174
MD_TDZ_Y							= 175
MD_SPEAKER_STATE			= 176		-- 正在使用的小喇叭物品索引号
MD_BLUEHALO_DAYTIME		= 177		-- 上次领取新蓝光环的时间
MD_HUASHANJIANGLI_TIME	=	178	--	华山论剑奖励时间
MD_PEXP_GP_VALUE	=	179	--	帮贡领取师傅经验值
MD_PEXP_GP_TIME		=	180	--	帮贡领取师傅经验时间
MD_SHUILAO_ACCEPT_COUNT	=	181	--	水牢每天接受任务的次数
MD_SHUILAO_ACCEPT_TIME	=	182	--	水牢接受任务的时间
MD_JIAOFEI_KILL_BOSS_TIME = 183 -- 镜湖剿匪杀boss的总次数
MD_SHANG_YUE_FANG_YIAN_HUA = 184 -- 美丽的夜西湖 赏月放烟花
MD_ZHONGQIU_TUANYUANPIE1_DAYTIME		= 185		-- 上次以个人身份领取团圆欢庆月饼的时间
MD_ZHONGQIU_TUANYUANPIE2_DAYTIME		= 186		-- 上次以夫妻身份领取团圆欢庆月饼的时间
MD_ZHONGQIU_TUANYUANPIE3_DAYTIME		= 187		-- 上次以结拜身份领取团圆欢庆月饼的时间
MD_ZHONGQIU_TUANYUANPIE4A_DAYTIME		= 188		-- 上次以师傅身份领取团圆欢庆月饼的时间
MD_ZHONGQIU_TUANYUANPIE4B_DAYTIME		= 189 	-- 上次以徒弟身份领取团圆欢庆月饼的时间
MD_AZHU_TUERDUO_COUNT = 190 -- 阿朱循环任务 兔耳朵计数
MD_PRISON_SHENYUAN_DAYTIME = 191 --上次伸冤的日期
MD_COUPLEQUESTION_DAYTIME	= 192 -- 夫妻做回答问题的时间，一天一次
MD_CUJU_PRE_TIME = 193					-- 上一次参加蹴鞠活动的时间
MD_MISSHENBING_WEAPONLEVEL	= 194 -- 血欲神兵任务扣除的武器等级
MD_YANZIWU_TIMES			=	195  -- 每天进入燕子坞的次数
MD_PRE_YANZIWU_TIME		=	196  -- 上一次去燕子坞的时间
MD_SHITU_PRIZE_COUNT = 197			-- 师徒抽奖次数
MD_JOINMEIPAI_DAYTIME = 198		--上一次推荐玩家加入门派的日期
MD_JOINMEIPAI_COUNT = 199		--今天推荐玩家加入门派的次数
MD_LASTPLAYER_ID = 200 			-- 上次所杀玩家的ID
MD_XICONGTIANJIANG_LASTLV = 201	--07圣诞元旦活动_喜从天降 玩家上次参加本活动的级别
MD_GETGIFT_COUNT = 202		  --圣诞元旦今天换取奖品次数
MD_GETGIFT_TIME = 203		  --圣诞元旦今天换取奖品次数
MD_DAOJISHIDATI_YUANDAN_DAYTIME = 204 --07圣诞元旦活动_倒计时答题玩家上次参加的时间
MD_DAOJISHIDATI_EXP = 205 						--07圣诞元旦活动_倒计时答题玩家可以获得的经验
MD_QIANXUN_FUQI_DAYTIME 	= 206		-- 接受千寻夫妻关系任务的时间
MD_QIANXUN_JIEBAI_DAYTIME = 207		-- 接受千寻结拜关系任务的时间
MD_QIANXUN_SHITU_DAYTIME 	= 208		-- 接受千寻师徒关系任务的时间
MD_QIANXUN_SELECT_MISSIONTYPE = 209	-- 玩家所选的千寻任务类型
MD_HANYUBED_USEBOOK_LASTDAY = 210	-- 玩家上次使用寒玉床挂机书的日期
MD_XINGYUN_DATA = 211	-- 玩家是否参与抽奖和3个奖品的类型
MD_HANYUBED_CANADDEXP_COUNT = 212	-- 玩家在寒玉床可以获得经验的次数(寒玉床阀值功能)
MD_XINGYUN_TIME_INFO = 213	-- 幸运轮盘时间信息
MD_50WAN_TIME_INFO = 214	-- 50万同庆时间信息

MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME		= 215		-- 上次以个人身份领取的天之饺子时间
MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME		= 216		-- 上次以夫妻身份领取天之饺子的时间
MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME		= 217		-- 上次以结拜身份领取天之饺子的时间
MD_CHUNJIE_TUANYUANJIAOZI4A_DAYTIME		= 218		-- 上次以师傅身份领取天之饺子的时间
MD_CHUNJIE_TUANYUANJIAOZI4B_DAYTIME		= 219 	-- 上次以徒弟身份领取天之饺子的时间
MD_CHUNJIE_BIANPAO_DAYTIME		= 220		--上次领取鞭炮时间
MD_CHUNJIE_BIANPAO_NUMBER			= 221		--今天领取鞭炮个数
MD_SPRING07DENGMI_DAYTIME = 222	--07元宵节活动_上次答灯谜时间
MD_SHUANGXIANGPAO_LASTTIME = 223	--双响炮活动_上次抽奖日期和次数
MD_GUILD_MANAGER_DRAW_BONUS = 224	--帮派官员领取福利时间
MD_YURENJIE_LASTTIME = 225	--该位记录"愚人节活动"上次领取的时间(以天为单位)	--add by xindefeng
MD_GODOFFIRE_DAYTIME = 226	--上次圣火传递活动的参加时间

MD_LINGQUZHAOPAI_HAVESENDMAIL	=	227			--该位记录五一期间玩家登陆是否收到过"领取招牌活动"发送的邮件		--add by xindefeng
MD_LINGQUZHAOPAI_LASTDATE = 228					--该位记录"五一领取招牌活动"上次领取的日期(以天为单位)	--add by xindefeng
MD_GODOFFIRE_COMPLETE_COUNT	=	229				--该玩家完成圣火活动的次数
MD_GODOFFIRE_COMPLETE_STEPNUM	=	230			--该玩家完成圣火活动任务链第几步
MD_GODOFFIRE_COMPLETE_DAYTIME	=	231			--该玩家完成圣火活动的时间(以天为单位)
MD_PIAOMIAOFENG_LASTTIME			= 232			--上次挑战缥缈峰的日期和次数
MD_SHITUZONGDONGYUAN_PRIZE_COUNT	=	233			--师徒总动员当天领取奖品次数
MD_PIAOMIAOFENG_SMALL_LASTTIME		= 234		--上次挑战缥缈峰简单版的日期和次数
MD_EX_HUMAN_QIANNENG_SUBJOIN = 235			--玩家对潜能点数的附加操作
MD_SHITU_XINLIANXIN		= 236  --师徒心连心奖励领取时间
MD_GIFT_OUTLINE = 237            --离线经验馈赠类型
MD_SIGNATURE_GETPRIZE_TIME 	= 238 -- 签名活动兑奖时间 zchw
MD_SPY_DAYCOUNT 						= 239	-- 打探消息任务一天完成次数 个位保存次数 10的倍数为时间（天） zchw
MD_SEEK_TREASURE 						= 240 -- 寻宝活动 zchw
MD_XINSANHUAN_1_LAST	= 241 --新三环任务第一环黄金之链任务的最后放弃时间
MD_XINSANHUAN_1_DAYTIME	= 242 --新三环任务第一环黄金之链任务的当日次数
MD_XINSANHUAN_2_LAST	= 243 --新三环任务第二环玄佛珠任务的最后放弃时间
MD_XINSANHUAN_2_DAYTIME	= 244 --新三环任务第二环玄佛珠任务的当日次数
MD_XINSANHUAN_3_LAST	= 245 --新三环任务第三环熔岩之地任务的最后放弃时间
MD_XINSANHUAN_3_DAYTIME	= 246 --新三环任务第三环熔岩之地任务的当日次数
MD_BANGGONGPAI_DAYTIME	= 247 --帮贡牌的当日次数
MD_GUILD_COLLECT_DATA		= 248 --帮派收集活动数据 zchw
MD_REEXPERIENCE_WEDDING	= 249 --重温婚礼 zchw
MD_SHIMENCAIJI_COUNT          =250 --师门采集当天的次数
MD_SHIMENCAIJI_DAY            =251 --师门采集的日期
MD_QINGRENJIE_ARROWDAY        =252  --情人节活动上次领爱神之箭日期
MD_QINGRENJIE_KISSDAY         =253  --情人节活动上次领取爱神之吻的日期
MD_SHIMENCAIJI_ABANDON        =254  --师门采集活动当天的放弃次数
MD_RESET_PMFSMALL_COUNT_LASTTIME	= 255	--上次重置小缥缈峰挑战次数 的日期和次数
MD_FINDFRIENDAD_DELTIME_MARRY = 256      --征友系统中，玩家上次撤销征婚信息的时间  --已扩展，可以加256
MD_FINDFRIENDAD_DELTIME_GUILD = 257      --征友系统中，玩家上次撤销征帮派成员信息的时间
MD_FINDFRIENDAD_DELTIME_TEACHER = 258      --征友系统中，玩家上次撤销征师徒信息的时间
MD_FINDFRIENDAD_DELTIME_BROTHER = 259      --征友系统中，玩家上次撤销征兄弟信息的时间
MD_GUILDBATTLE_SCORE 			= 260      --帮战个人积分
MD_GUILDBATTLE_FLAG 			= 261      --帮战个人占领大旗次数
MD_GUILDBATTLE_RES 				= 262      --帮战个人采集资源个数
MD_GUILDBATTLE_PRIZESCORE = 263      --帮战个人荣誉积分
MD_TW_REEXPERIENCE_WEDDING_TODAY_COUNT	= 264--重温婚礼今日次数 xiehong
MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT	= 265--重温婚礼总次数 xiehong
MD_TW_HANYU_SPOUSEBOOK_LASTUSEDAY = 266 --夫妻行动要诀 zchw
MD_HEXIE_GUANGHUAN_DATE	= 267		--和谐光环活动上一次加BUFF的日期（2009-3-26到2009-5-9） xiehong
MD_HEXIE_GUANGHUAN_MAIL_DATE	= 268		--和谐光环活动上一次发送邮件的日期（2009-3-26到2009-5-9） xiehong
MD_LUOYANG_CITYMONEY = 269      		 --最后领取洛阳城市工资的时间
MD_BAIBIANLIANPU_TIME = 270              --上次参加百变脸谱活动时间
MD_MUWANQING_TUERDUO_COUNT = 271				 --木婉清分组寻物 兔耳朵计数 zchw

MD_TW_YURENJIE_LAST_LOGIN_DATE = 272 --愚人节上一次登陆时间 xiehong
MD_TW_YURENJIE_LAST_GET_EXP_DATE = 273 --愚人节上一次领经验的时间 xiehong
MD_JQXH_DUANYANQING_COUNT = 274			--段延庆任务任务计数 [tx]
--****begin****以下部分为年虫问题修复增加的missiondata add by zhangguoxin 090207*********************
MD_CAOYUN_DAYTIME										= 275			--漕运任务时间数据
MD_FASONGTONGZHI_DAYTIME						= 276			--发送通知的时间数据
MD_BAIMASI_DAYTIME									= 277			--白马寺任务 时间记录
MD_CHENGXIONGDATU_DAYTIME						= 278			--逞凶打图 时间数据
MD_SHIMEN_DAYTIME										= 279			--师门任务 时间数据
--****end******年虫问题修复增加的missiondata add by zhangguoxin 090207*******************************
MD_LIXIAN_POOLEXP	= 280 	--离线经验池数据
MD_TW_QIANDAO_LAST_JOIN_TIME	= 281 --签到活动上一次时间 xiehong
MD_TW_QIANDAO_JOIN_COUNT		= 282 --签到次数 xiehong
MD_TW_XINGFUMOTIANLUN_LAST_MAIL_DATE		= 283 --幸福摩天轮，收取邮件日期 xiehong

MD_TW_JIANIANHUA_XUANMU_DATE = 284 --参加嘉年华-旋转木马活动时间
MD_TW_BRAVERYCHALLENGE_RESET = 285 --勇者过山车重置周标记 --zz       
MD_TW_BRAVERYCHALLENGE_GIFT  = 286 --勇者过山车领奖 --zz 
MD_DAY_TO_HAVE_DWJKL  = 297	--获得端午节快乐的时间[tx]五一活动
MD_HK_TW_DAY_H1N1_COUNT	=	306	--台湾香港H1N1活动每天的计数
MD_SJZ_TIMES			=	242  -- 每天进入四绝庄的次数
MD_PRE_SJZ_TIME		=	243  -- 上一次去四绝庄的时间
MD_SSLT_TIMES			=	244  -- 每天进入生死擂台的次数
MD_PRE_SSLT_TIME		=	245  -- 上一次去生死擂台的时间
MD_SSS_TIMES			=	246  -- 每天进入少室山的次数
MD_PRE_SSS_TIME		=	287  -- 上一次去少室山的时间
MD_ZHONGCHUI		=	288  -- 领取钟桘
MD_XIANHUAZHONGZI		=	289  -- 领取鲜花的种子
MD_JIANGSHI_TIMES		=	290  
MD_PRE_JIANGSHI_TIME		=	291  

--*******************************************************************************
--游戏标记位，目前最大能到 319
--*******************************************************************************
MF_Dialog_01				= 0		-- 赵天师对话标记
MF_GetAwardFlag				= 1		-- 是否激活 CD-KEY 领取奖励条件
MF_GetAward0Flag			= 2		-- 是否已经领取初级 CD-Key 奖品
MF_GetAward1Flag			= 3		-- 是否已经领取 30 级 CD-Key 奖品
MF_GetAward2Flag			= 4		-- 是否已经领取 60 级 CD-Key 奖品
MF_BUCHANG_MONEY    =5     --删档补偿是否领了钱
MF_BUCHANG_STONE     =6     --删档补偿是否领了石头
MF_BUCHANG_EQUIP      =7     --删档补偿是否领了装备
MF_ActiveNewUserCard	=8		--是否激活新手卡,558
MF_GetNewUserCard0		=9		--是否已经领取1级新手卡奖品588
MF_GetNewUserCard1		=10		--是否已经领取15级新手卡奖品588
MF_GetNewUserCard2		=11		--是否已经领取30级新手卡奖品588
MF_GetNewUserCard3		=12		--是否已经领取40级新手卡奖品588
MF_GetNewUserCard4		=13		--是否已经领取50级新手卡奖品588
MF_GetNewUserCard5		=14		--是否已经领取60级新手卡奖品588
MF_GetNewUserCard6		=15		--是否已经领取70级新手卡奖品588
MF_GetNewUserCard7		=16		--是否已经领取80级新手卡奖品588
MF_ActiveSportsCard		=17		--是否领取体育竞猜奖励
MF_ActiveJuCard				=18		--是否领取网聚活动奖励
MF_LunjianJiangli01		=19		--华山论剑奖励标记01
MF_LunjianJiangli02		=20		--华山论剑奖励标记02
MF_LunjianJiangli03		=21		--华山论剑奖励标记03
MF_AZHU_RELATION_RESET	=22		--阿朱关系值是否已经重置过了
MF_CannotPrisonShenyuan =23	--当前是否禁止伸冤
MF_TianGongJiangli60		=24		--天工开物60级奖励标记
MF_TianGongJiangli70		=25		--天工开物70级奖励标记
MF_TianGongJiangli80		=26		--天工开物80级奖励标记
MF_CHOUJIANGDALIBAO01   =27   --抽奖大礼包一级
MF_CHOUJIANGDALIBAO02   =28   --抽奖大礼包二级
MF_DATAOSHA_WIN					=29		--大逃杀单回合获胜标记
MF_ActiveWenZhouCard		=30		--温州推广活动标记
MF_CHRISTMAS07_GIFT			=31		--07圣诞元旦活动_圣诞守夜礼物领取标记
MF_LABORDAY_PETCAGE_GIFT		=32		--是否参加了2008/05/01的兽栏赠送活动
MF_LABORDAY_PETCAGE_MAIL		=33		--是否收到了2008/05/01兽栏赠送活动邮件
MF_ShiTuHelp_Mail		=34		--是否发送师徒总动员活动邮件
MF_ShiTuHelp_30_prentice	=35		--自己是否领取过30级奖励
MF_ShiTuHelp_30_master		=36		--师傅是否领取过30级奖励
MF_ShiTuHelp_45_prentice	=37		--自己是否领取过30级奖励
MF_ShiTuHelp_45_master		=38		--师傅是否领取过30级奖励
MF_ShiTu_ChuShi_Flag			= 39  --是否出师
MF_DianHuaMiBao_Gift	= 40 --是否领取了电话密保赠品 byLB JIA2008-7-29 10:26:30
MF_AnBaoDaLiBao_Gift		=41 --是否领取了安保大礼包
MF_ActiveNewUserCard666	=42		--是否激活新手卡,666
MF_GetNewUserCard0_666		=43		--是否已经领取1级新手卡奖品666
MF_GetNewUserCard1_666		=44		--是否已经领取15级新手卡奖品666
MF_GetNewUserCard2_666		=45		--是否已经领取30级新手卡奖品666
MF_GetNewUserCard3_666		=46		--是否已经领取40级新手卡奖品666
MF_GetNewUserCard4_666		=47		--是否已经领取50级新手卡奖品666
MF_GetNewUserCard5_666		=48		--是否已经领取60级新手卡奖品666
MF_GetNewUserCard6_666		=49		--是否已经领取70级新手卡奖品666
MF_GetNewUserCard7_666		=50		--是否已经领取80级新手卡奖品666
MF_Xueshengzhuang_flag      =51     --9月17日学生装活动是否已经参加过
MF_BangZhan_Kill_Flag = 52      --帮战后的奖励（领取杀人次数最多称号）
MF_BangZhan_Flag_Flag = 53      --帮战后的奖励（领取占领旗帜最多称号）
MF_BangZhan_Source_Flag = 54      --帮战后的奖励（领取采集资源最多称号）
MF_CHRISTMAS08_GIFT			= 55		--08圣诞元旦活动_圣诞守夜礼物领取标记 zchw
MF_NEWPLAYER10_USED     =56     --新人礼包（10级)是否使用过
MF_GEM_PRIZE_FLAG			=57	
MF_TW_SCHOOLUNIFORM_JOIN =58       --是否参加过海外天使校服养成计划
MF_TW_EXPDAN10           =59       --是否使用过10级经验丹
MF_TW_EXPDAN20           =60       --是否使用过20级经验丹
MF_TW_EXPDAN30           =61       --是否使用过30级经验丹
MF_TW_EXPDAN40           =62       --是否使用过40级经验丹
MF_TW_EXPDAN50           =63       --是否使用过50级经验丹
MF_DARK_NOTIFYMAIL       =64
MF_TW_ZONGHENGSIHAI_JOIN =65 --天龙嘉年华之纵横四海活动参加过 xiehong
MF_TW_BRAVERYCHALLENGE1   =66       --台湾50勇者过车山任务一标志--zz
MF_TW_BRAVERYCHALLENGE2   =67       --台湾50勇者过车山任务二标志--zz（暂时废弃） 由于MissionFlag算法有问题，67会导致错误的结果
MF_TW_BRAVERYCHALLENGE3   =68       --台湾50勇者过车山任务三标志--zz 
MF_TW_BRAVERYCHALLENGE22   =69       --台湾50勇者过车山任务二标志--zz

MF_GetQianKunDai  =70       --是否领取过江湖干坤袋(上线领及补领)
--*******************************************************************************
--场景号
--*******************************************************************************
SCENE_SCRIPT_ID		= 888888
ALONENPC_SCRIPT_ID	= 888898
ALONENPC_TARGET_ID	= -123
PRIZE_SCRIPT_ID		= 888899

-- 副本存玩家平均级别与怪物默认级别的级别差，差值用于场景初始化时对怪物级别进行调整，此编号固定不能改
-- scene.lua 中也有声明，在此声明只是为了让脚本检查不至于不通过
CopyScene_LevelGap	= 31

SCENE_LUOYANG			= 0		-- 洛阳
SCENE_SUZHOU			= 1		-- 苏州
SCENE_DALI				= 2		-- 大理
SCENE_SONGSHAN			= 3		-- 嵩山
SCENE_TAIHU				= 4		-- 太湖
SCENE_JINGHU			= 5		-- 镜湖
SCENE_WULIANG			= 6		-- 无量山
SCENE_JIANGE			= 7		-- 剑阁
SCENE_DUNHUANG			= 8		-- 敦煌
SCENE_SHAOLIN			= 9		-- 少林寺
SCENE_GAIBANG			= 10	-- 丐帮总舵
SCENE_PRISON			= 151	-- 监狱
SCENE_LOULAN			=	186	-- 楼兰--add by xindefeng


--*******************************************************************************
--装备代号表
--*******************************************************************************
HEQUIP_WEAPON			= 0		-- 武器	WEAPON
HEQUIP_CAP				= 1		-- 帽子	DEFENCE
HEQUIP_ARMOR			= 2		-- 盔甲	DEFENCE
HEQUIP_CUFF				= 3		-- 护腕	DEFENCE
HEQUIP_BOOT				= 4		-- 鞋	DEFENCE
HEQUIP_SASH				= 5		-- 腰带	ADORN
HEQUIP_RING				= 6		-- 戒子	ADORN
HEQUIP_NECKLACE			= 7		-- 项链	ADORN
HEQUIP_RING_2			= 11	-- 戒指2	ADORN
HEQUIP_CHARM			= 12	--护符	DEFENCE
HEQUIP_CHARM_2			= 13	--第二个护符	DEFENCE
HEQUIP_WRIST			= 14	--护腕	DEFENCE
HEQUIP_SHOULDER			= 15	--护肩	ADORN
HEQUIP_DARK				= 17	--暗器

-- 珍兽脚本
PETCOMMON				= 335000

--副本类型
FUBEN_EXAMPLE			= 999
FUBEN_MURENXIANG_7 		= 998
FUBEN_MURENXIANG_9		= 997
FUBEN_MURENXIANG		= 996
FUBEN_SHUILAO			= 995
FUBEN_ZHENGLONG			= 994
FUBEN_PVP_LEITAI		= 993
FUBEN_BOZANG			= 992
FUBEN_TAOHUAZHEN		= 991
FUBEN_JIUJIAO			= 990
FUBEN_GUANGMINGDONG		= 989
FUBEN_TALIN				= 988
FUBEN_TADI				= 987
FUBEN_ZHEMEIFENG		= 986
FUBEN_LINGXINGFENG		= 985
FUBEN_GUDI				= 984
FUBEN_WUSHENDONG		= 983
FUBEN_RENWULIAN			= 982
FUBEN_MINE				= 981
FUBEN_KILLVERMIN		= 980
FUBEN_CHUCKOUTVILLAIN	= 979
FUBEN_CONVOYPET			= 978
FUBEN_BIANGUAN			= 977	-- 用于中秋任务
FUBEN_JIAOCHANG			= 976
FUBEN_TALIN1			= 975
FUBEN_GUANGMINGDONG1	= 974
FUBEN_JIUJIAO1			= 973
FUBEN_LINGXINGFENG1		= 972
FUBEN_TAOHUAZHEN1		= 971
FUBEN_TADI1				= 970
FUBEN_WUSHENDONG1		= 969
FUBEN_ZHEMEIFENG1		= 968
FUBEN_GUDI1				= 967
FUBEN_SHIJI2			= 966
FUBEN_GONGDI			= 965
FUBEN_SHIJI1			= 964
FUBEN_KAOCHANG			= 963
FUBEN_WEDDING			= 962
FUBEN_DATAOSHA			= 961
FUBEN_SONGLIAO			= 960
FUBEN_ZHULIN			= 959
FUBEN_FEIZHAI			= 958
FUBEN_ZEIBINGRUQIN	    = 957
FUBEN_JUQING			= 956
FUBEN_GUOFANG			= 955
FUBEN_BAOZANG			= 954
FUBEN_TIANLONG1			= 953
FUBEN_SHAOLIN1			= 952
FUBEN_MINGJIAO1			= 951
FUBEN_GAIBANG1			= 950
FUBEN_EMEI1				= 949
FUBEN_XINGXIU1			= 948
FUBEN_XIAOYAO1			= 947
FUBEN_WUDANG1			= 946
FUBEN_TIANSHAN1			= 945
FUBEN_YMGTAISHOUFU		= 944
FUBEN_JIAOFEI			= 943
FUBEN_CUJU					= 942
FUBEN_PORTECT_PET	= 941
FUBEN_CATCH_PET		= 940
FUBEN_DAZHAN_YZW	= 939
FUBEN_GODFIRE			= 938
FUBEN_PIAOMIAOFENG	= 937
FUBEN_PROTECTGUILD		= 936
FUBEN_XINSHENGSHOUSHAN = 935
FUBEN_SEEK_TREASURE		 = 934 -- zchw
FUBEN_HUANGJINZHILIAN	= 933
FUBEN_XUANFOUZHU	= 932
FUBEN_RONGYANZHIDI	= 931
FUBEN_BANGZHAN	= 930
FUBEN_JUQING_CANGMANGSHAN = 929
FUBEN_ZHIWU_JS = 928
--FUBEN_SHAOSHISHAN = 928
FUBEN_BINGSHENGQIZHEN	= 927
FUBEN_WANGLING	= 926

--漕运货商事件
PRE_TIME = 0
DUA_TIME = 0
EVENT_NOW = 0
TRAFFICKER_CLICK_TIMES = 0
CANDIDATE_EXAM = {
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},

{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0}
}

TOP_3_EXAM = {
{time = 99999, guid =0},
{time = 99999, guid =0},
{time = 99999, guid =0}
}
-- 帮会相关枚举值
GUILD_IND_LEVEL		= 0			--工业度0
GUILD_AGR_LEVEL		= 1			--农业度1
GUILD_COM_LEVEL		= 2			--商业度2
GUILD_DEF_LEVEL		= 3			--防卫度3
GUILD_TECH_LEVEL	= 4			--科技度4
GUILD_AMBI_LEVEL	= 5			--扩张度5
GUILD_CONTRIB_POINT	= 6		--贡献度6
GUILD_MONEY				= 7			--帮派资金7
GUILD_IND_RATE		= 8			--工业率8
GUILD_AGR_RATE		= 9			--农业率9
GUILD_COM_RATE		= 10		--商业率10
GUILD_DEF_RATE		= 11		--国防率11
GUILD_TECH_RATE		= 12		--科技率12
GUILD_AMBI_RATE		= 13		--扩张率13
GUILD_SALARY		= 14		--工资次数14
-- 绝望之地需要的变量
x026000_nDescIndex	= 0

-- 学习门派轻功的花费(50银币)
STUDY_MENPAI_QINGGONG_SPEND = 100

--帮派职位
GUILD_POSITION_INVALID			= 0			--无效位置
GUILD_POSITION_TRAINEE			=	1			--预备帮众，待批准
GUILD_POSITION_MEMBER				=	2			--普通帮众
GUILD_POSITION_ELITE_MEMBER	=	3			--精英帮众
GUILD_POSITION_COM					=	4			--商业官员
GUILD_POSITION_AGRI					=	5			--农业官员
GUILD_POSITION_INDUSTRY			=	6			--工业官员
GUILD_POSITION_HR						=	7			--人事官员
GUILD_POSITION_ASS_CHIEFTAIN=	8			--副帮主
GUILD_POSITION_CHIEFTAIN		=	9			--帮主

--银票变参
TICKET_ITEM_PARAM_CUR_MONEY_START	= 0		--存在跑商银票上的当前现金数据的start
TICKET_ITEM_PARAM_CUR_MONEY_TYPE	= 2		--存在跑商银票上的当前现金数据的type
TICKET_ITEM_PARAM_MAX_MONEY_START	= 4		--存在跑商银票上的当前现金上限的start
TICKET_ITEM_PARAM_MAX_MONEY_TYPE	= 2		--存在跑商银票上的当前现金上限的type
TICKET_ITEM_PARAM_MAX_MAX_MONEY_START = 8	--存在跑商银票上的当前现金上限的上限的start
TICKET_ITEM_PARAM_MAX_MAX_MONEY_TYPE = 2	--存在跑商银票上的当前现金上限的上限的type

--活动相关的标识
EACTIVITY_BEFOREHAND_START = 0		-- 预告阶段
EACTIVITY_SOON_START = 1					-- 即将开始
EACTIVITY_JUSTNOW_START = 2				-- 刚刚开始
EACTIVITY_INPROCESS = 3						-- 进行中...
EACTIVITY_BEFOREHAND_STOP = 4			-- 即将结束

--物品质量生成规则
QUALITY_MUST_BE_CHANGE        = 0 -- 可能需要被修改（这个参数值最后要被修改成下面的值）
QUALITY_CREATE_DEFAULT        = 0 -- 默认规则
QUALITY_CREATE_BY_MONSTER     = 0 -- 怪物掉落规则
QUALITY_CREATE_BY_BOSS        = 1 -- BOSS怪掉落规则
QUALITY_CREATE_BY_FOUNDRY_NOR = 2 -- 低级材料锻造
QUALITY_CREATE_BY_FOUNDRY_ADV = 3 -- 高级材料锻造

--药鼎相关
JINGHU_YAODING_CREATER_NAME	  =""

--体育竞猜卡相关
SPORTS_CARD_PRIZE = {
50101001,50101002,50102001,50102002,50102003,50102004,
50103001,50104002,50111001,50111002,50112001,50112002,
50112003,50112004,50113001,50113002,50113003,50113004,
50113005,50114001
}

--功能开关类型
ONOFF_T_PETPRO	= 0	--珍兽繁殖
ONOFF_T_GUILD		= 1	--建帮
ONOFF_T_CITY		= 2	--建城
ONOFF_T_PSHOP		= 3	--玩家商店
ONOFF_T_CSHOP		= 4	--寄售商店
ONOFF_T_YBCASH		= 5	--元宝票NPC兑换
ONOFF_T_YBUSE		= 6	--元宝票使用

--调试相关脚本
DEBUGHOOK_SCRIPT	= 777777

--夫妻相关日志编号
COUPLE_LOG_STARTQUESTION 			= 1
COUPLE_LOG_STOPQUESTION				= 2
COUPLE_LOG_FINISHQUESTION			= 3
COUPLE_LOG_LEARNSKILL					= 4
COUPLE_LOG_LEVELUPSKILL				= 5

--夫妻相关日志编号对应的日志信息
COUPLE_LOG_DETAIL = {
	[COUPLE_LOG_STARTQUESTION]	= "COUPLE_LOG_STARTQUESTION",
	[COUPLE_LOG_STOPQUESTION]		= "COUPLE_LOG_STOPQUESTION",
	[COUPLE_LOG_FINISHQUESTION]	= "COUPLE_LOG_FINISHQUESTION",
	[COUPLE_LOG_LEARNSKILL]			= "COUPLE_LOG_LEARNSKILL",
	[COUPLE_LOG_LEVELUPSKILL]		= "COUPLE_LOG_LEVELUPSKILL",
}

--抽奖日志编号
PRIZE_LOG_XINSHOUSHITU				= 1	--新手师徒抽奖


--帮派管理者福利
MIN_APPOINT_TIME_FOR_BONUS          = 7200  --领取帮派福利的任职时间要求（单位分钟） 五天

--帮会福利领取的金钱表，    领取的金钱=min( 帮派金钱*列1,帮会等级*列2 )
GUILD_MANAGER_BONUS_MONEY_TABLE = {
    [GUILD_POSITION_INVALID]			=   { 0.0, 0},			--无效位置
    [GUILD_POSITION_TRAINEE]			=	{ 0.0, 0},			--预备帮众，待批准
    [GUILD_POSITION_MEMBER]				=	{ 0.0, 0},			--普通帮众
    [GUILD_POSITION_ELITE_MEMBER]	    =	{ 0.0, 0},			--精英帮众
    [GUILD_POSITION_COM]			    =	{ 0.01, 10000},			--商业官员
    [GUILD_POSITION_AGRI]				=	{ 0.01, 10000},			--农业官员
    [GUILD_POSITION_INDUSTRY]			=	{ 0.01, 10000},			--工业官员
    [GUILD_POSITION_HR]					=	{ 0.01, 10000},			--人事官员
    [GUILD_POSITION_ASS_CHIEFTAIN]      =	{ 0.03, 30000},			--副帮主
    [GUILD_POSITION_CHIEFTAIN]		    =	{ 0.05, 50000},			--帮主
}

--帮会福利领取的经验表，  领取的经验=帮会等级*帮会等级*职位表数据
GUILD_MANAGER_BONUS_EXP_TABLE = {
    [GUILD_POSITION_INVALID]			=   0,			--无效位置
    [GUILD_POSITION_TRAINEE]			=	0,			--预备帮众，待批准
    [GUILD_POSITION_MEMBER]				=	0,			--普通帮众
    [GUILD_POSITION_ELITE_MEMBER]	    =	0,			--精英帮众
    [GUILD_POSITION_COM]			    =	100,			--商业官员
    [GUILD_POSITION_AGRI]				=	100,			--农业官员
    [GUILD_POSITION_INDUSTRY]			=	100,			--工业官员
    [GUILD_POSITION_HR]					=	100,			--人事官员
    [GUILD_POSITION_ASS_CHIEFTAIN]      =	200,			--副帮主
    [GUILD_POSITION_CHIEFTAIN]		    =	300,			--帮主
}

--帮派职位名称
GUILD_POSITION_NAME_TABLE = {
    [GUILD_POSITION_INVALID]			=   "无效",			--无效位置
    [GUILD_POSITION_TRAINEE]			=	"预备群众",			--预备帮众，待批准
    [GUILD_POSITION_MEMBER]				=	"帮众",			--普通帮众
    [GUILD_POSITION_ELITE_MEMBER]	    =	"精英",			--精英帮众
    [GUILD_POSITION_COM]			    =	"商人",			--商业官员
    [GUILD_POSITION_AGRI]				=	"弘化使",			--农业官员
    [GUILD_POSITION_INDUSTRY]			=	"工务使",			--工业官员
    [GUILD_POSITION_HR]					=	"内务使",			--人事官员
    [GUILD_POSITION_ASS_CHIEFTAIN]      =	"副帮主",			--副帮主
    [GUILD_POSITION_CHIEFTAIN]		    =	"帮主",			--帮主
}


---------------------------------------------------------------
--活动相关，活动会涉及到N个脚本配合的情况，所以定义一些公共变量
--刘盾 2008-04-17
---------------------------------------------------------------
--2008-04-17 兽栏赠送活动
GlobalLaborDayActivityTable = {
	PetCageCardID					= 40004446, --签名牌物品ID
	PetCageLv1 						= 30509500, --兽栏一级物品ID
	PetCageDelayBuff 				= 5941,
	
	PetCagePresentStartTime 		= 20080501, --兑换兽栏开始时间
	PetCagePresentEndTime 			= 20080504, --兑换兽栏结束时间
	
	CardPresentStartTime 			= 20080501,	--签名牌开始兑换时间
	CardPresentEndTime 				= 20080503,	--签名牌结束兑换时间
	
	MailStartDayTime 				= 20080501,	--发送邮件开始时间
	MailEndDayTime 					= 20080503	--发送邮件结束时间
}


--帮会任务管理器相关

CITY_MISSION_TYPE_BUILDING	= 	0		--建设任务	
CITY_MISSION_TYPE_RESEARCH	=	1		--研究任务
CITY_MISSION_TYPE_KUOZHANG	=	2		--扩张任务
CITY_MISSION_TYPE_GONGCHENG	=	3		--工程任务
CITY_MISSION_TYPE_KEJI		=	4		--科技任务
CITY_MISSION_TYPE_FAZHAN	=	5		--发展任务
CITY_MISSION_TYPE_SHIJI		=	6		--市集任务
CITY_MISSION_TYPE_GUOFANG	=	7		--国防任务
CITY_MISSION_TYPE_MAX		=	8		--类型最大值


CITY_MISSION_VALUE_TYPE_MONEY		=	0	--任务管理器金钱类型
CITY_MISSION_VALUE_TYPE_CONTRI		=	1	--任务管理器帮贡类型
CITY_MISSION_VALUE_TYPE_CLOSED		=	2	--任务管理器开关
CITY_MISSION_VALUE_TYPE_MONEY_SUM	=	3	--任务管理器金钱剩余
CITY_MISSION_VALUE_TYPE_CONTRI_SUM	=	4	--任务管理器帮贡剩余
CITY_MISSION_VALUE_TYPE_MAX			=	5	--类型最大值

CITY_MISSION_MGR_VALUE_TABLE_OFFSET	=	5
CITY_MISSION_MGR_VALUE_TABLE = {
	[0]		=	{	ContriCtrl = -5,	MoneyCtrl = 0.5 },
	[1]		=	{	ContriCtrl = -4,	MoneyCtrl = 0.6 },
	[2]		=	{	ContriCtrl = -3,	MoneyCtrl = 0.7 },
	[3]		=	{	ContriCtrl = -2,	MoneyCtrl = 0.8 },
	[4]		=	{	ContriCtrl = -1,	MoneyCtrl = 0.9 },
	[5]		=	{	ContriCtrl = 0,		MoneyCtrl = 1 },
	[6]		=	{	ContriCtrl = 1,		MoneyCtrl = 1.1 },
	[7]		=	{	ContriCtrl = 2,		MoneyCtrl = 1.2 },
	[8]		=	{	ContriCtrl = 3,		MoneyCtrl = 1.3 },
	[9]		=	{	ContriCtrl = 4,		MoneyCtrl = 1.4 },
	[10]	=	{	ContriCtrl = 5,		MoneyCtrl = 1.5 },
}

--LUA_AUDIT_ID BEGIN

LUAAUDIT_EXAMPLE = 1;
LUAAUDIT_BANGZHAN_CREATEFUBEN = 2;	--帮战创建副本
LUAAUDIT_BANGZHAN_RESOURCE = 3;			--每天涿鹿副本内的资源交纳量
LUAAUDIT_BANGZHAN_FLAG = 4;					--帮战中央战场旗帜占领次数
LUAAUDIT_BANGZHAN_HONOUR = 5;				--帮战副本放出荣誉值数量
LUAAUDIT_BANGZHAN_EXCHANGEHONOUR = 6;--帮战荣誉值换取各项奖品的数量
LUAAUDIT_BANGZHAN_TITLE_BUFF = 7;		--帮战领取帮会征讨个人称号和buff的数量
LUAAUDIT_PETSHELIZI = 8;	--炼制珍兽舍利子的人数和次数
LUAAUDIT_LOVEDAY = 9;			--情人节活动 每天参加活动的人次
LUAAUDIT_DENGMI_START = 10;	--元宵节灯谜 点开界面的玩家
LUAAUDIT_DENGMI_END = 11;		--元宵节灯谜 完成所有答题的玩家
--hzp 2009-1-14
LUAAUDIT_TSLB10 = 12;
LUAAUDIT_TSLB20 = 13;
LUAAUDIT_TSLB30 = 14;
LUAAUDIT_TSLB40 = 15;

LUAAUDIT_TSLBOUT = 16;
LUAAUDIT_SNOW = 17;			--瑞雪兆丰年活动
LUAAUDIT_MPCARD_EXCHANGE = 18;	--门派贺贴 参与节日符节兑换人数。
LUAAUDIT_MPCARD_PRIZE = 19;			--门派贺贴 在诸葛孔亮处参与抽奖的人数和获得的礼品。
LUAAUDIT_FEIHUANGSHI = 20;--[tx43454]兑换飞蝗石	
LUAAUDIT_FEIHUANGSHI_BOUND = 21;--[tx43454]兑换绑定飞蝗石	
LUAAUDIT_MEIHUABIAO = 22;--[tx43454]兑换梅花镖
LUAAUDIT_MWQ_TUERDUO = 23; --木婉清分组寻物 兔耳朵放出统计
LUAAUDIT_UNIVERSEBAG =24 --江湖干坤袋使用统计
LUAAUDIT_ANQITUPO = 25; --暗器突破瓶颈统计
LUAAUDIT_QIANKUNDAI_BULING_LEVEL1 = 33 ;--补领干坤袋
LUAAUDIT_LINGQU_DWJKL = 44; --成功领取端午节快乐任务
LUAAUDIT_USE_MWZONGZI = 45; --使用美味的粽子
LUAAUDIT_MWZONGZI_PRIZE = 46; --使用粽子后的随机奖励
LUAAUDIT_H1N1_WUXINGLINGPAI = 47;	--获得五行令牌
LUAAUDIT_H1N1_CHONGLOUYU = 48;	--兑换重楼玉
LUAAUDIT_77_GIFTBAG = 49;	--开七夕礼包
--LUA_AUDIT_ID END

LUAAUDIT_TYPE_STRING =
{
	[LUAAUDIT_EXAMPLE] = "LUAAUDIT_EXAMPLE",
	[LUAAUDIT_BANGZHAN_CREATEFUBEN] = "LUAAUDIT_BANGZHAN_CREATEFUBEN",
	[LUAAUDIT_BANGZHAN_RESOURCE] = "LUAAUDIT_BANGZHAN_RESOURCE",
	[LUAAUDIT_BANGZHAN_FLAG] = "LUAAUDIT_BANGZHAN_FLAG",
	[LUAAUDIT_BANGZHAN_HONOUR] = "LUAAUDIT_BANGZHAN_HONOUR",
	[LUAAUDIT_BANGZHAN_EXCHANGEHONOUR] = "LUAAUDIT_BANGZHAN_EXCHANGEHONOUR",
	[LUAAUDIT_BANGZHAN_TITLE_BUFF] = "LUAAUDIT_BANGZHAN_TITLE_BUFF",
	[LUAAUDIT_PETSHELIZI] = "LUAAUDIT_PETSHELIZI",
	[LUAAUDIT_LOVEDAY] = "LUAAUDIT_LOVEDAY",
	[LUAAUDIT_DENGMI_START] = "LUAAUDIT_DENGMI_START",
	[LUAAUDIT_DENGMI_END] = "LUAAUDIT_DENGMI_END",
	--hzp 2009-1-14
	[LUAAUDIT_TSLB10] = "LUAAUDIT_TSLB10",
	[LUAAUDIT_TSLB20] = "LUAAUDIT_TSLB20",
	[LUAAUDIT_TSLB30] = "LUAAUDIT_TSLB30",
	[LUAAUDIT_TSLB40] = "LUAAUDIT_TSLB40",
	[LUAAUDIT_TSLBOUT]	= "LUAAUDIT_TSLBOUT",
	[LUAAUDIT_SNOW] = "LUAAUDIT_SNOW",
	[LUAAUDIT_MPCARD_EXCHANGE] = "LUAAUDIT_MPCARD_EXCHANGE",
	[LUAAUDIT_MPCARD_PRIZE] = "LUAAUDIT_MPCARD_PRIZE",
	[LUAAUDIT_FEIHUANGSHI] = "LUAAUDIT_FEIHUANGSHI",	--[tx43454]	
	[LUAAUDIT_FEIHUANGSHI_BOUND] = "LUAAUDIT_FEIHUANGSHI_BOUND",	--[tx43454]	
	[LUAAUDIT_MEIHUABIAO] = "LUAAUDIT_MEIHUABIAO", --[tx43454]
	[LUAAUDIT_MWQ_TUERDUO] = "LUAAUDIT_MWQ_TUERDUO",
	[LUAAUDIT_UNIVERSEBAG]= "LUAAUDIT_UNIVERSEBAG",
	[LUAAUDIT_ANQITUPO] = "LUAAUDIT_ANQITUPO",
	[LUAAUDIT_QIANKUNDAI_BULING_LEVEL1] = "LUAAUDIT_QIANKUNDAI_BULING_LEVEL1",
	[LUAAUDIT_LINGQU_DWJKL]="LUAAUDIT_LINGQU_DWJKL",
	[LUAAUDIT_USE_MWZONGZI]="LUAAUDIT_USE_MWZONGZI",
	[LUAAUDIT_MWZONGZI_PRIZE]="LUAAUDIT_MWZONGZI_PRIZE",
	[LUAAUDIT_H1N1_WUXINGLINGPAI]="LUAAUDIT_H1N1_WUXINGLINGPAI",
	[LUAAUDIT_H1N1_CHONGLOUYU]="LUAAUDIT_H1N1_CHONGLOUYU",
	[LUAAUDIT_77_GIFTBAG]="LUAAUDIT_77_GIFTBAG",
}
--******************************************************
--通用Audit日志接口
--type：	统计日志标识，须以LUAAUDIT做前缀。
--logStr：自定义日志字符串。
--添加人：zchw
--******************************************************
function ScriptGlobal_AuditGeneralLog(type, guid, logStr)
	if type >= 1  and type <= getn(LUAAUDIT_TYPE_STRING) then
		local str;
		if logStr == nil then
			str = format("%s,0X%08X,", LUAAUDIT_TYPE_STRING[type], guid);
		else
			str = format("%s,0X%08X,%s,", LUAAUDIT_TYPE_STRING[type], guid, logStr);
		end		
		LuaFnAuditGeneralLog(str);
		return 1;
	end
	return 0;
end

--******************************************************
--判断一个表中所有的正整数是否有重复，注意，所有负数,nil都会被忽略
--参数: 表容器numTable
--没有重复元素返回1；
--没有元素或者传入nil，返回0
--dun.liu 2009.2.5
--******************************************************
function ScriptGlobal_IsUniqueNumberTable( numTable )
	
	local isUnique = 1;
	
	if( numTable == nil ) then
		return 0;
	end
	
	local tableLen = getn(numTable)
	if(tableLen <= 0) then
		return 0;
	end
	
	for i = 1, tableLen do
		if numTable[i] ~= nil and numTable[i] >= 0  then
		    for j = 1, tableLen do
		        if i ~= j and numTable[i] == numTable[j] then
		            isUnique = 0;
		            return isUnique;
		        end
		    end
	    end
	end
	
	return isUnique;
	
end
