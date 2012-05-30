-- BOSS群 刷小怪通用AI
--祝凯 2007-09-30
--功能: 每隔指定时间在自己附近刷出小怪....

--(策划使用本AI需要向本人交纳使用费4000元宝，程序员4折)


--刷小怪的数据表....
x810100_CreateChildTbl = {

	-- MotherID			使用本AI的BOSS的MonsterID....
	-- CreateTime		此BOSS多久刷一次小怪....
	-- CreateNum		此BOSS每次刷多少个小怪....
	-- AllChildNum	此BOSS最多刷出多少个小怪....
	-- ChildID			此BOSS要刷的小怪的ID....
	-- BaseAI				小怪的BaseAI....
	-- ExtAIScript	小怪的扩展AI....
	-- ScriptID			小怪的脚本ID....
	-- LifeTime			小怪的寿命(毫秒)....小于等于0为无限....

	--举例:
	--想让水鬼探子(962)刷云母石人(1082)....每5秒刷一个....每次刷2个一共刷5个....云母石人寿命为10秒....
	--需要给水鬼探子挂上本AI脚本....然后在下边配置一条刷怪的数据....
	--{ MotherID=962, CreateTime=5*1000, CreateNum=2, AllChildNum=5, ChildID=1082, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=10*1000 }


	--玄武岛BOSS群 毒蛤王刷小怪....
	{ MotherID=9100, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9150, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	--玄武岛BOSS群 小BOSS刷小怪....
	{ MotherID=9101, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9151, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9102, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9152, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9103, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9153, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9104, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9154, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9105, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9155, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9106, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9156, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9107, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9157, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9108, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9158, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9109, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9159, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },


	--武夷BOSS群  千年冰魄刷小怪....
	{ MotherID=9120, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9140, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	--武夷BOSS群  小BOSS刷小怪....
	{ MotherID=9121, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9141, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9122, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9142, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9123, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9143, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9124, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9144, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9125, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9145, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9126, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9146, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9127, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9147, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9128, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9148, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },
	{ MotherID=9129, CreateTime=60000, CreateNum=6, AllChildNum=900, ChildID=9149, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=45000 },

	--四绝BOSS刷小怪....
	{ MotherID=42180, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=42188, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=42181, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=42189, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=42182, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=42190, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=42183, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=42191, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=42184, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=42192, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=42185, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=42193, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=42186, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=42194, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=42187, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=42194, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	
	--兵圣奇阵普通版BOSS刷小怪....
	{ MotherID=15006, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15011, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15007, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15012, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15008, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15013, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15009, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15014, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15010, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15015, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15006, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15016, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15007, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15017, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15008, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15018, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15009, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15019, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15010, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15020, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	
	{ MotherID=15026, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15036, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15027, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15037, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15028, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15038, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15029, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15039, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15030, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15040, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15026, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15041, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15027, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15042, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15028, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15043, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15029, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15044, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15030, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15045, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15026, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15046, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15027, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15047, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15028, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15048, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15029, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15049, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15030, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15050, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15031, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15051, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15032, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15052, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15033, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15053, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15034, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15054, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15035, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15055, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15031, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15056, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15032, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15057, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15033, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15058, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15034, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15059, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15035, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15060, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15031, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15061, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15032, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15062, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15033, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15063, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15034, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15064, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15035, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15065, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15071, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15076, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15072, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15077, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15073, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15078, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15074, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15079, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15075, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15080, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15086, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15091, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15087, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15092, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15088, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15093, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15089, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15094, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15090, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15095, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	--兵圣奇阵困难版BOSS刷小怪....
	{ MotherID=15106, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15111, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15107, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15112, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15108, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15113, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15109, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15114, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15110, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15115, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15106, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15116, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15107, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15117, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15108, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15118, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15109, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15119, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15110, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15120, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	
	{ MotherID=15126, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15136, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15127, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15137, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15128, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15138, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15129, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15139, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15130, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15140, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15126, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15141, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15127, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15142, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15128, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15143, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15129, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15144, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15130, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15145, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15126, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15146, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15127, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15147, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15128, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15148, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15129, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15149, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15130, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15150, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15131, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15151, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15132, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15152, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15133, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15153, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15134, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15154, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15135, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15155, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15131, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15156, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15132, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15157, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15133, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15158, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15134, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15159, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15135, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15160, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15131, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15161, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15132, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15162, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15133, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15163, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15134, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15164, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15135, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15165, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15171, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15176, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15172, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15177, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15173, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15178, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15174, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15179, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15175, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15180, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },

	{ MotherID=15186, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15191, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15187, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15192, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15188, CreateTime=60000, CreateNum=1, AllChildNum=4, ChildID=15193, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15189, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15194, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },
	{ MotherID=15190, CreateTime=60000, CreateNum=1, AllChildNum=2, ChildID=15195, BaseAI=0, ExtAIScript=-1, ScriptID=-1, LifeTime=1200000 },



}

--小怪刷新点列表....
--坐标为相对于本BOSS的相对坐标....可以填写任意数目个坐标....刷小怪时从中随机选取一个使用....
x810100_MonsterPosTbl = {

	{ x = 0,  y = 0  },

}

x810100_IDX_UpdateMonsterTime = 1
x810100_IDX_NeedCreateMonsterNum = 2
x810100_IDX_EnableCreateMonster = 1
x810100_IDX_CombatFlag = 2

function x810100_OnDie( sceneId, selfId, killerId )
	MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_UpdateMonsterTime, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_NeedCreateMonsterNum, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_EnableCreateMonster, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_CombatFlag, 0)
end

function x810100_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x810100_IDX_CombatFlag) then
		return
	end

	--检测是否已经不需要再刷小怪了....
	if 0 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x810100_IDX_EnableCreateMonster) then
		return
	end

	--还未到刷小怪的时间....
	local UpdateTime = MonsterAI_GetIntParamByIndex(sceneId, selfId, x810100_IDX_UpdateMonsterTime)
	if nTick < UpdateTime then
		UpdateTime = UpdateTime - nTick
		MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_UpdateMonsterTime, UpdateTime)
		return
	end


	--到了刷小怪的时间了....刷小怪....

	--寻找本BOSS的刷怪数据表....
	local BossDataID = GetMonsterDataID( sceneId, selfId )
	local bFind = 0
	local CreateData
	for _, Data in x810100_CreateChildTbl do
		if BossDataID == Data.MotherID then
			CreateData = Data
			bFind = 1
			break
		end
	end

	local CreateNum = 0
	local NeedCreateNum = MonsterAI_GetIntParamByIndex(sceneId, selfId,  x810100_IDX_NeedCreateMonsterNum, 0)

	if NeedCreateNum <= CreateData.CreateNum then
		CreateNum = NeedCreateNum
		MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_EnableCreateMonster, 0)
	else
		CreateNum = CreateData.CreateNum
	end
	LuaFnNpcChat(sceneId, selfId, 0, "不知死活的家伙，我的手下就能干掉你！")
	for i = 1, CreateNum do
		x810100_CreateChildMonster( sceneId, selfId, CreateData )
	end

	MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_NeedCreateMonsterNum, NeedCreateNum-CreateNum)
	MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_UpdateMonsterTime, CreateData.CreateTime)

end

function x810100_OnInit(sceneId, selfId)

	--寻找本BOSS的刷怪数据表....
	local BossDataID = GetMonsterDataID( sceneId, selfId )
	local bFind = 0
	local CreateData
	for _, Data in x810100_CreateChildTbl do
		if BossDataID == Data.MotherID then
			CreateData = Data
			bFind = 1
			break
		end
	end

	--初始化AI参数....
	MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_UpdateMonsterTime, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_NeedCreateMonsterNum, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_EnableCreateMonster, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_CombatFlag, 0)

	if bFind == 1 then
		if CreateData.CreateTime>0 and CreateData.CreateNum>0 and CreateData.AllChildNum>0 then
			MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_UpdateMonsterTime, CreateData.CreateTime)
			MonsterAI_SetIntParamByIndex(sceneId, selfId,  x810100_IDX_NeedCreateMonsterNum, CreateData.AllChildNum)
			MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_EnableCreateMonster, 1)
		end
	end

end

function x810100_OnKillCharacter(sceneId, selfId, targetId)

	--LuaFnNpcChat(sceneId, selfId, 0, "我杀死一个人了....去死吧你....")

	--if(-1~=targetId) then
		--local szTarget = GetName(sceneId, targetId)
		--local str = format( "我杀死一个人了....%s(杀死的玩家名)，我早看你不爽了....", szTarget )
		--LuaFnNpcChat(sceneId, selfId, 0, str)
	--end

end

function x810100_OnEnterCombat(sceneId, selfId, enmeyId)
	--LuaFnNpcChat(sceneId, selfId, 0, "我进入战斗了....你们等着去找孟婆吧....")
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_CombatFlag, 1)
end

function x810100_OnLeaveCombat(sceneId, selfId)
	--LuaFnNpcChat(sceneId, selfId, 0, "我离开战斗了....大家先停下吃点药吧....")
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x810100_IDX_CombatFlag, 0)
end

--创建一个小怪....
function x810100_CreateChildMonster(sceneId, selfId, CreateData)

	local PosX, PosY = LuaFnGetWorldPos( sceneId, selfId )
	local PosNum = getn( x810100_MonsterPosTbl )
	local PosIndex = random( PosNum )
	PosX = PosX + x810100_MonsterPosTbl[PosIndex].x
	PosY = PosY + x810100_MonsterPosTbl[PosIndex].y

	MonId = LuaFnCreateMonster(sceneId, CreateData.ChildID, PosX, PosY, CreateData.BaseAI, CreateData.ExtAIScript, CreateData.ScriptID )
	if CreateData.LifeTime > 0 then
		SetCharacterDieTime(sceneId, MonId, CreateData.LifeTime )
	end

end
