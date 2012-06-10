x300053_g_scriptId = 300053
--**********************************
-- 事件交互入口
--**********************************
function x300053_OnDefaultEvent( sceneId, selfId )
	if GetNumText()>=100 and GetNumText()<200 then
		x300053_SuiShen(sceneId, selfId)
	elseif GetNumText()>=200 and GetNumText()<300 then
		x300053_JiaRuMenPai(sceneId, selfId,0)
	elseif GetNumText()>=300 and GetNumText()<400 then
		x300053_BaoShi(sceneId, selfId)
	elseif GetNumText()>=400 and GetNumText()<500 or GetNumText()>=1000 and GetNumText()<2000 then
		x300053_ChuanSong(sceneId, selfId, 0,0)
	elseif GetNumText()>=500 and GetNumText()<600 then
		x300053_EquipBase(sceneId,selfId)
	elseif GetNumText()>=600 and GetNumText()<700 then
		x300053_Pet(sceneId,selfId)
	elseif GetNumText() == 7777  then
		x300053_XinFa(sceneId,selfId)
	elseif GetNumText() == 8888  then
		x300053_BackToIndex( sceneId, selfId )
	elseif GetNumText() == 9999  then
		x300053_CloseMe(sceneId, selfId)
	end
end
--**********************************
--装备功能
--**********************************
function x300053_Pet(sceneId,selfId)
	if GetNumText()==600 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    随身宝石宝宝相关功能集合。")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff技能学习     #R【珍兽技能学习】", 5, 601)
			AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText()==601 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 223)
	end
end
--**********************************
--装备功能
--**********************************
function x300053_EquipBase(sceneId,selfId)
	if GetNumText()==500 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    随身装备功能集合。")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff资质鉴定     #R【装备资质鉴定】", 5, 501)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff资质重鉴     #R【重新鉴定资质】", 5, 502)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff装备强化     #R【装备等级强化】", 5, 503)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff修理次数     #R【增加修理次数】", 5, 504)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff装备刻铭     #R【装备随身刻铭】", 5, 505)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff装备除铭     #R【装备随身除铭】", 5, 506)
			AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText()==501 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )
	elseif GetNumText()==502 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112233 )
	elseif GetNumText()==503 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1002)
	elseif GetNumText()==504 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1004)
	elseif GetNumText()==505 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1005)
	elseif GetNumText()==506 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,selfId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1006)
	end
end
--**********************************
--传送功能
--**********************************
function x300053_ChuanSong(sceneId,selfId,key,isNPC)
	if key==0 then
		key=GetNumText()	
	end
	if key==400 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    #R四#Y大主城（楼兰、大理、苏州、洛阳）和十大门派BOSS点传送。")
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff城市区域", 9, 401)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff门派区域", 9, 402)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fffBOSS区域", 9, 404)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff练级区域", 9, 403)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff副本区域", 9, 406)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff其他区域", 9, 405)
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==401 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    主要城市、常用区域传送界面:")
			AddNumText(sceneId, x300053_g_scriptId,"     #cff0000楼兰", 9, 424)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff大理", 9, 421)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff洛阳", 9, 422)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff苏州", 9, 423)
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff凤鸣镇 ", 9, 1502)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff洛阳校场     #R【洛阳切磋圣地】", 9, 425)
            --AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff老苏州城     #R【主要神器制作】", 9, 425)
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==425 then
		x300053_MsgBox( sceneId, selfId, "#cfff263    楼兰主城已重新规划，可进行切磋了，直接返回主城挑战对方。" )
		--x300053_GoTo(sceneId,selfId,0, 186, 328)--洛阳
	elseif key==402 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    十大门派传送界面:")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 慕容    #R【慕容山庄】", 9, 440)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 星宿      #R【星宿海】", 9, 441)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 逍遥      #R【凌波洞】", 9, 442)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 少林      #R【少林寺】", 9, 443)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 天山      #R【北天山】", 9, 444)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 天龙      #R【天龙寺】", 9, 445)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 峨眉      #R【峨眉山】", 9, 446)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 武当      #R【武当山】", 9, 447)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 明教      #R【光明殿】", 9, 448)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff门派 - 丐帮    #R【丐帮总舵】", 9, 449)
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==404 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    怪太猛，最好找别人先上，自己在后面捡装备就行了。")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff束河古镇  #R【BOSS专区】", 9, 1501)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff古墓九层  #R【BOSS专区】", 9, 1503)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff嵩山竞技  #R【BOSS专区】", 9, 1504)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff凤鸣镇    #R【BOSS专区】", 9, 1502)
            AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff通天塔顶  #R【BOSS专区】", 9, 1512)
            AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff少室山    #R【BOSS专区】", 9, 1513)
                    if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
        elseif key==1513 then
		x300053_GoTo(sceneId,selfId,561, 15, 33)--杀星
	elseif key==1512 then
		x300053_GoTo(sceneId,selfId,548, 256, 278)--通天塔
        elseif key==1504 then
		x300053_GoTo(sceneId,selfId,414, 100, 98)--嵩山竞技
	elseif key==1503 then
		x300053_GoTo(sceneId,selfId,167, 56, 79)--燕王古墓
	elseif key==1501 then
		x300053_GoTo(sceneId,selfId,420, 200, 211)--束河古镇
	elseif key==1502 then
		x300053_GoTo(sceneId,selfId,580, 158, 61)--凤鸣镇
	elseif key==403 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    练级一条龙场景，怪超多，经验超爽:")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff通天塔地宫       #R45 - 100", 9, 450)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff燕王古墓1层      #R35 - 60", 9, 1401)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff燕王古墓7层      #R60 - 80", 9, 1402)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff秦皇地宫1层      #R80 - 100", 9, 1403)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff秦皇地宫2层      #R80 - 100", 9, 1404)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff秦皇地宫3层      #R80 - 100", 9, 1405)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff圣火宫           #R100 - 150", 9, 1406)
			--AddNumText(sceneId, x300053_g_scriptId,"#cff0000通天塔地宫       #R【100 - 150】", 9, 450)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff昆仑福地           #R【100 - 150】", 9, 470)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff凤凰陵墓           #R【100 - 150】", 9, 462)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff天劫楼7层           #R【100 - 150】", 9, 464)

			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==1401 then
		x300053_GoTo(sceneId,selfId,159, 68, 93)--燕王古墓1层
	elseif key==1402 then
		x300053_GoTo(sceneId,selfId,165, 29, 106)--燕王古墓7层
	elseif key==1403 then
		x300053_GoTo(sceneId,selfId,400, 228, 219)--秦皇地宫1层
	elseif key==1404 then
		x300053_GoTo(sceneId,selfId,401, 185, 163)--秦皇地宫2层
	elseif key==1405 then
		x300053_GoTo(sceneId,selfId,402, 225, 214)--秦皇地宫3层
	elseif key==1406 then
		x300053_GoTo(sceneId,selfId,537, 23, 107)--圣火宫

	elseif key==461 then
		x300053_GoTo(sceneId,selfId,421,  109, 21)--昆仑山
	elseif key==462 then
		x300053_GoTo(sceneId,selfId,539,  39, 43)--凤凰古城
	elseif key==463 then
		x300053_GoTo(sceneId,selfId,442,  104, 299)--清源
	elseif key==464 then
		x300053_GoTo(sceneId,selfId,533,  100, 100)--天劫楼
	elseif key==465 then
		x300053_GoTo(sceneId,selfId,443,  43, 218)--清源山洞
	elseif key==466 then
		x300053_GoTo(sceneId,selfId,441,  92, 91)--凤凰平原
	elseif key==467 then
		x300053_GoTo(sceneId,selfId,421,  100, 100)--逐鹿战场
	elseif key==468 then
		x300053_GoTo(sceneId,selfId,440,  100, 100)--凤凰陵墓
	elseif key==469 then
		x300053_GoTo(sceneId,selfId,420,  100, 100)--束河古镇
	elseif key==470 then
		x300053_GoTo(sceneId,selfId,421,  100, 100)--昆仑福地
	elseif key==450 then
		x300053_GoTo(sceneId,selfId,295,  256.211, 378.436)--通天塔地宫
	elseif key==422 then
		x300053_GoTo(sceneId,selfId,0, 233, 321)--洛阳
	elseif key==423 then
		x300053_GoTo(sceneId,selfId,1, 196, 259)--苏州
	elseif key==424 then
		x300053_GoTo(sceneId,selfId,186, 158, 44)--楼兰
	elseif key==421 then
		x300053_GoTo(sceneId,selfId,2, 375, 225)--大理
	elseif key==440 then
		x300053_GoTo(sceneId,selfId,535, 154, 165)--慕容
	elseif key==441 then
		x300053_GoTo(sceneId,selfId,16,  96, 152)--星宿
	elseif key==442 then
		x300053_GoTo(sceneId,selfId,14,  67, 145)--逍遥
	elseif key==443 then
		x300053_GoTo(sceneId,selfId,9,  96, 127)--少林
	elseif key==444 then
		x300053_GoTo(sceneId,selfId,17,  95, 120)--天山
	elseif key==445 then
		x300053_GoTo(sceneId,selfId,13,  96, 120)--天龙
	elseif key==446 then
		x300053_GoTo(sceneId,selfId,15,  89, 139)--峨眉
	elseif key==447 then
		x300053_GoTo(sceneId,selfId,12, 103, 150)--武当
	elseif key==448 then
		x300053_GoTo(sceneId,selfId,11,  98, 167)--明教
	elseif key==449 then
		x300053_GoTo(sceneId,selfId,10,  91, 116)--丐帮
	elseif key==405 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    其他场景传送:")
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff圣兽山  ", 9, 1301)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff武夷    ", 9, 1302)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff银皑雪原", 9, 1303)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff草原    ", 9, 1304)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff苍山    ", 9, 1305)			
			AddNumText(sceneId, x300053_g_scriptId,"   #g3f3fff塔克拉玛干", 9, 1306)			
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==1301 then
		x300053_GoTo(sceneId,selfId,158, 231,226)--圣兽山
	elseif key==1302 then
		x300053_GoTo(sceneId,selfId,32, 43, 37)--武夷
	elseif key==1303 then
		x300053_GoTo(sceneId,selfId,188, 60, 214)--银皑雪原
	elseif key==1304 then
		x300053_GoTo(sceneId,selfId,20, 279, 255)--草原
	elseif key==1305 then
		x300053_GoTo(sceneId,selfId,25, 276, 52)--苍山
	elseif key==1306 then
		x300053_GoTo(sceneId,selfId,427, 34, 25)--塔克拉玛干
	elseif key==406 then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y    天龙副本，特殊场景传送:")
			--AddNumText(sceneId, x300053_g_scriptId,"#cff0000BOSS卡召唤地图   #R【特殊场景】", 9, 1201)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff蹴鞠副本", 9, 1202)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff棋局副本", 9, 1203)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff水牢副本", 9, 1204)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff燕子副本", 9, 1205)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff楼兰寻宝", 9, 1206)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff新三环", 9, 1207)						
			AddNumText(sceneId, x300053_g_scriptId,"     #g3f3fff飘渺峰", 9, 1208)						
			if isNPC==0 then
				AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif key==1201 then
		x300053_GoTo(sceneId,selfId,458, 32, 33)--BOSS卡召唤地图
	elseif key==1202 then
		x300053_GoTo(sceneId,selfId,2, 443, 231)--蹴鞠副本
	elseif key==1203 then
		x300053_GoTo(sceneId,selfId,2, 430, 234)--棋局副本
	elseif key==1204 then
		x300053_GoTo(sceneId,selfId,1, 339, 310)--水牢副本
	elseif key==1205 then
		x300053_GoTo(sceneId,selfId,4, 70, 121)--燕子副本
	elseif key==1206 then
		x300053_GoTo(sceneId,selfId,186, 162, 75)--楼兰寻宝
	elseif key==1207 then
		x300053_GoTo(sceneId,selfId,186, 290, 66)--新三环
	elseif key==1208 then
		x300053_GoTo(sceneId,selfId,186, 191, 219)--新少室山飘渺
	end
end
--**********************************
--传送功能
--**********************************
function x300053_GoTo( sceneId, selfId, toSceneId, x, y )
	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x210504_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	if sceneId~=0 and sceneId~=1 and sceneId~=2 and sceneId~=16 and sceneId~=14 and sceneId~=9 and sceneId~=17 and sceneId~=13 and sceneId~=15 and sceneId~=12 and sceneId~=11 and sceneId~=10 and sceneId~=380 and sceneId~=186 then
		x300053_Tips( sceneId, selfId, "您目前所在的场景无法使用传送功能，请回城后再使用" )
		x300053_CloseMe(sceneId, selfId)
		return
	end
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, toSceneId, x, y )
end
--**********************************
--返回主页
--**********************************
function x300053_BackToIndex( sceneId, selfId )
	x399999_OnDefaultEvent( sceneId, selfId, -1 )
end
--**********************************
--玩家屏幕中间提示
--**********************************
function x300053_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x300053_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end
--**********************************
--关闭对话框
--**********************************
function x300053_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
--**********************************
--宝石功能
--**********************************
function x300053_BaoShi(sceneId,selfId)
	if GetNumText()==300 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    随身宝石相关功能集合。打孔为免费一键背包装备全部三孔，非常方便玩家。(只需点击一次，无需按多)")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff我要打孔     #cFF0000【背包一键三孔】", 5, 301)
			AddNumText(sceneId, x300053_g_scriptId,"#cff0000极限打孔     #R【装备四孔打造】", 5, 302)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff宝石合成     #R【低级合成高级】", 5, 303)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff宝石镶嵌     #R【装备镶嵌宝石】", 5, 306)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff宝石摘除     #R【摘除装备宝石】", 5, 304)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff材料合成     #R【材料合成功能】", 5, 305)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff宝石雕琢     #R【宝石雕琢功能】", 5, 307)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff宝石熔炼     #R【高阶宝石熔炼】", 5, 308)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3ffftest", 5, 309)
			AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText()==301 then
		local tEquipGemTable = { 0, 1, 2, 3, 4, 5, 6, 7, 12, 14, 15 ,8,17 }--8,坐骑,17暗器
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend = GetBasicBagEndPos(sceneId, selfId)		
		for i=bagbegin, bagend do
			local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, i )			
			if itemIndex>0 then
				local ret = LuaFnIsItemLocked( sceneId, selfId, i )
				if ret ~= 0 then
					return
				end	
				local EquipType = LuaFnGetBagEquipType( sceneId, selfId, i )				
				local find = 0
				for j, gem in tEquipGemTable do
					if gem == EquipType then
						find = 1
					end
				end
				if find == 1 then	
					local equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )					
					while equipMaxGemCount<3 do				
						local ret = AddBagItemSlot( sceneId, selfId, i )
						equipMaxGemCount = GetBagGemCount( sceneId, selfId, i )			
					end
				end
			end
		end
		x300053_MsgBox( sceneId, selfId, "#Y    恭喜您，您背包里所有的装备均已全部成功打孔到[#R3#Y]。" )
	elseif GetNumText()==302 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		UICommand_AddInt( sceneId, 1 )--type，点金之箭
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 75117 )
	elseif GetNumText()==303 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 23 )
	elseif GetNumText()==304 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 27 )
	elseif GetNumText()==305 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810424 )
	elseif GetNumText()==306 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19830424 )
	elseif GetNumText()==307 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112236 )
	elseif GetNumText()==308 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112237 )
	elseif GetNumText()==309 then
		CallScriptFunction( 380002, "OnDefaultEvent", sceneId, selfId )
	end
end

--**********************************
--随身功能
--**********************************
function x300053_SuiShen(sceneId,selfId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId, "#G    [领取元宝]请确保身上元宝维持在2000万以下，否则有可能会造成无法上线的情况，请使用完再领取。")
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff我要元宝     #R【无限领取元宝】", 5, 101)			
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff赠点兑换     #R【金币兑换赠点】", 7, 120)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff打開銀行     #R【远程随身仓库】", 7, 102)
			--AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff提升心法     #R【随身心法提升】", 12, 7777)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff领取奖励     #R【领取冲级奖励】", 12, 130)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff经验清零     #R【经验不正常用】", 12, 104)
			AddNumText(sceneId, x300053_g_scriptId,"#cff0000时装染色     #cff0000【独创时装染色】", 12, 106)
			--AddNumText(sceneId, x300053_g_scriptId,"#cff0000Test     #cff0000【Test】", 12, 107)
			AddNumText(sceneId, x300053_g_scriptId,"#cff0000解除漕运     #R【临时解决状态】", 5, 108)
			AddNumText(sceneId, x300053_g_scriptId,"#g3f3fff查看公告     #R【玩家上线公告】", 12, 103)
			AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText() == 108  then
		LuaFnCancelSpecificImpact(sceneId,selfId,113)
		LuaFnCancelSpecificImpact(sceneId,selfId,200)
		LuaFnCancelSpecificImpact(sceneId,selfId,33815)
		x300053_CloseMe(sceneId, selfId)
	elseif GetNumText() == 107  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, 0 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20111202)
	elseif GetNumText() == 106  then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  0910281)
	elseif GetNumText() == 105  then
		BeginEvent( sceneId )
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			for i = 0,1000  do
				AddExp(sceneId,selfId,GetExp(sceneId,selfId)*-1)
			end
			AddText(sceneId,"恭喜您，已经成功为你清空了经验！")
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	elseif GetNumText() == 104  then
		BeginEvent( sceneId )
		AddText( sceneId, "本功能提高给某些玩家经验出现负数的情况，请玩家不要保存经验，升完了尽快用掉。不要把经验存到爆了去，就出现负数的情况了。" )
		AddNumText(sceneId, x300053_g_scriptId, "是的，我要清零。", 12, 105 )
		AddNumText(sceneId, x300053_g_scriptId,"我点错了", 8, 8888)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	elseif GetNumText() == 101  then
		local getYB=500000;
		--ZengDian(sceneId,selfId,targetId,1,getYB)
		YuanBao(sceneId,selfId,targetId,1,getYB)
		x300053_Tips( sceneId, selfId, "恭喜你，成功领取 "..getYB.." 元宝。" )
		x300053_CloseMe(sceneId, selfId)
	elseif GetNumText() == 102  then
		if sceneId==0 or sceneId==1 or sceneId==2 or sceneId==186 then
			BankBegin(sceneId, selfId, selfId)				
		else
			x300053_Tips( sceneId, selfId, "只有主城地图才可是用远程银行" )
			x300053_CloseMe(sceneId, selfId)
		end		
	elseif GetNumText() == 103  then
		CallScriptFunction( 380002, "OnDefaultEvent", sceneId, selfId )
	elseif GetNumText() == 120  then
		BeginEvent(sceneId)
			AddText(sceneId,"#G    在这里，您可以利用您身上的金币兑换本服的赠点，兑换比例为 #r#e6f00c7#g3f3fff[#R#{_MONEY10000}#g3f3fff]:[#R10#g3f3fff赠点]")
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff开始兑换", 5, 121 )
			AddNumText( sceneId, x300053_g_scriptId, "下次再来", 8, 9999 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText() == 121  then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 5430 )
	elseif GetNumText() == 130  then
		BeginEvent(sceneId)
			AddText(sceneId,"    #G这里可以领取等级奖励！当你达到以下等级！就可以选择以下选项选择奖励！感谢您的支持，祝您游戏愉快！")
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取80级奖励      #gFF3E96[5W]赠点", 5, 131 )
			ddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取100级奖励     #gFF3E96[10W]赠点", 5, 132 )
		       AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取130级奖励     #gFF3E96[15W]赠点", 5, 133 )
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取140级奖励     #gFF3E96[20W]赠点", 5, 134 )
			AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取150级奖励     #gFF3E96[30W]赠点", 5, 135 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取160级奖励     #gFF3E96[50W]赠点", 5, 136 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取170级奖励     #gFF3E96[60W]赠点", 5, 137 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取180级奖励     #gFF3E96[70W]赠点", 5, 138 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取190级奖励     #gFF3E96[80W]赠点", 5, 139 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取200级奖励     #gFF3E96[90W]赠点", 5, 140 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取210级奖励     #gFF3E96[100W]赠点", 5, 141 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取220级奖励     #gFF3E96[200W]赠点", 5, 142 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取230级奖励     #gFF3E96[300W]赠点", 5, 143 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取240级奖励     #gFF3E96[400W]赠点", 5, 144 )
			--AddNumText( sceneId, x300053_g_scriptId, "#g3f3fff领取250级奖励     #gFF3E96[500W]赠点", 5, 145 )
			AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif GetNumText() == 145  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<250 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到250级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL250 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,5000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL250, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取250级奖励: #G[500W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 144  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<240 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到240级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL240 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,4000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL240, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取240级奖励: #G[400W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 143  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<230 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到230级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL230 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,3000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL230, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取230级奖励: #G[300W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 142  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<220 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到220级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL220 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,2000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL220, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取220级奖励: #G[200W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 141  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<210 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到210级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL210 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,1000000)
			SetMissionData( sceneId, selfId, DANJIAN_JL210, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取210级奖励: #G[100W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 140  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<200 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到200级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL200 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,900000)
			SetMissionData( sceneId, selfId, DANJIAN_JL200, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取200级奖励: #G[90W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 139  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<190 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到190级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL190 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,800000)
			SetMissionData( sceneId, selfId, DANJIAN_JL190, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取190级奖励: #G[80W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 138  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<180 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到180级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL180 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,700000)
			SetMissionData( sceneId, selfId, DANJIAN_JL180, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取180级奖励: #G[70W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 137  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<170 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到170级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL170 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,600000)
			SetMissionData( sceneId, selfId, DANJIAN_JL170, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取170级奖励: #G[60W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 136  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<160 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到160级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL160 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,500000)
			SetMissionData( sceneId, selfId, DANJIAN_JL160, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取160级奖励: #G[50W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 135  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<149 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到150级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL150 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,300000)
			SetMissionData( sceneId, selfId, DANJIAN_JL150, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取150级奖励: #G[30W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 134  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<140 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到140级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL140 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,200000)
			SetMissionData( sceneId, selfId, DANJIAN_JL140, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取140级奖励: #G[20W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 133  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<130 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到130级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL130 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,150000)
			SetMissionData( sceneId, selfId, DANJIAN_JL130, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取130级奖励: #G[15W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 132  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<100 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到100级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL100 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,100000)
			SetMissionData( sceneId, selfId, DANJIAN_JL100, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取100级奖励: #G[10W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 131  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<80 then
			x300053_Tips( sceneId, selfId, "您的等级不够，请达到80级后再来找我。" )
			x300053_CloseMe(sceneId, selfId)
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL80 )
		if index == 1 then
			x300053_Tips( sceneId, selfId, "不好意思，您已经领取过该奖励。" )
			x300053_CloseMe(sceneId, selfId)
			return
		else
			ZengDian(sceneId,selfId,targetId,1,50000)
			SetMissionData( sceneId, selfId, DANJIAN_JL80, 1 )
			x300053_Tips( sceneId, selfId, "恭喜您，成功领取80级奖励: #G[5W] 增点#W。感谢您的支持，祝您游戏愉快！" )
			x300053_CloseMe(sceneId, selfId)
		end
	elseif GetNumText() == 132  then
		
	end
end

--**********************************
--加入门派奖励物品
--**********************************
function x300053_JiaRuMenPaiAddItem(sceneId,selfId,menpaiId)
	local qishu=0
	local zuoqi=0
	if menpaiId ==0 then
		qishu=30308081
		zuoqi=10470107
	elseif menpaiId ==1 then
		qishu=30308080
		zuoqi=10149029
	elseif menpaiId ==2 then
		qishu=30308079
		zuoqi=10149025
	elseif menpaiId ==3 then
		qishu=30308084
		zuoqi=10149023
	elseif menpaiId ==4 then
		qishu=30308078
		zuoqi=10149022
	elseif menpaiId ==5 then
		qishu=30308086
		zuoqi=10149028
	elseif menpaiId ==6 then
		qishu=30308082
		zuoqi=10149027
	elseif menpaiId ==7 then
		qishu=30308083
		zuoqi=10149021
	elseif menpaiId ==8 then
		qishu=30308085
		zuoqi=10149026
	elseif menpaiId ==9 then
		qishu=39920006
		zuoqi=10149035
	end
	BeginAddItem(sceneId)
		AddItem( sceneId, qishu, 1 )
		AddItem( sceneId, zuoqi, 1 )
	EndAddItem(sceneId,selfId)
	AddItemListToHuman(sceneId,selfId)
end

--**********************************
--加入门派检查
--**********************************
function x300053_CheckJiaRuMenPai(sceneId,selfId)
	local index =	GetMissionData( sceneId, selfId, MY_JIARUMENPAI )
	if index ==0 then
		return 1
	else
		if LuaFnGetAvailableItemCount(sceneId, selfId, 40004475) >= 1 then
			return 1
		else
			x300053_MsgBox( sceneId, selfId, "    #Y对不起，您已经加入过门派，如需更换门派，请前往元宝商店购买#G门派更换令#Y！" )
			return 0
		end
	end
	
end

--**********************************
--加入门派
--**********************************
function x300053_JiaRuMenPai(sceneId,selfId,key)
	if key==0 then
		key=GetNumText()
	end
	if key == 200 then
		BeginEvent( sceneId )
			AddText(sceneId,"亲爱的玩家！您好！")
			AddText( sceneId, "    #Y加入门派所有心法150。更换门派在 元宝商店-大卖场-武魂暗器-购买#R门派转换令" )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff慕容",3,201 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff星宿",3,202 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff逍遥",3,203 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff少林",3,204 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff天山",3,205 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff天龙",3,206 )		
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff武当",3,207 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff明教",3,208 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff丐帮",3,209 )
			AddNumText( sceneId, x300053_g_scriptId, "   #g3f3fff峨眉",3,210 )
			AddNumText(sceneId, x300053_g_scriptId,"#R返回主页", 8, 8888)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	elseif key == 201  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 9)
			LuaFnSetXinFaLevel(sceneId,selfId,64,150)
			LuaFnSetXinFaLevel(sceneId,selfId,65,150)
			LuaFnSetXinFaLevel(sceneId,selfId,66,150)
			LuaFnSetXinFaLevel(sceneId,selfId,67,150)
			LuaFnSetXinFaLevel(sceneId,selfId,68,150)
			LuaFnSetXinFaLevel(sceneId,selfId,69,150)
			LuaFnSetXinFaLevel(sceneId,selfId,70,150)
			LuaFnSetXinFaLevel(sceneId,selfId,71,150)
			AddSkill(  sceneId, selfId, 200)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,9)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);			
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G慕容世家#B门下，有了他的加入， #G慕容世家#B比之前更为强大了！", 4 )	
		end
	elseif key == 202  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 5)
			LuaFnSetXinFaLevel(sceneId,selfId,31,150)
			LuaFnSetXinFaLevel(sceneId,selfId,32,150)
			LuaFnSetXinFaLevel(sceneId,selfId,33,150)
			LuaFnSetXinFaLevel(sceneId,selfId,34,150)
			LuaFnSetXinFaLevel(sceneId,selfId,35,150)
			LuaFnSetXinFaLevel(sceneId,selfId,36,150)
			LuaFnSetXinFaLevel(sceneId,selfId,60,150)
			LuaFnSetXinFaLevel(sceneId,selfId,77,150)
			AddSkill(  sceneId, selfId, 28)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,5)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G星宿#B门下，有了他的加入， #G星宿#B比之前更为强大了！", 4 )
		end
	elseif key == 203  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 8)
			LuaFnSetXinFaLevel(sceneId,selfId,49,150)
			LuaFnSetXinFaLevel(sceneId,selfId,50,150)
			LuaFnSetXinFaLevel(sceneId,selfId,51,150)
			LuaFnSetXinFaLevel(sceneId,selfId,52,150)
			LuaFnSetXinFaLevel(sceneId,selfId,53,150)
			LuaFnSetXinFaLevel(sceneId,selfId,54,150)
			LuaFnSetXinFaLevel(sceneId,selfId,63,150)
			LuaFnSetXinFaLevel(sceneId,selfId,80,150)
			AddSkill(  sceneId, selfId, 31)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,8)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G逍遥#B门下，有了他的加入， #G逍遥#B比之前更为强大了！", 4 )
		end
	elseif key == 204  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 0)
			LuaFnSetXinFaLevel(sceneId,selfId,1,150)
			LuaFnSetXinFaLevel(sceneId,selfId,2,150)
			LuaFnSetXinFaLevel(sceneId,selfId,3,150)
			LuaFnSetXinFaLevel(sceneId,selfId,4,150)
			LuaFnSetXinFaLevel(sceneId,selfId,5,150)
			LuaFnSetXinFaLevel(sceneId,selfId,6,150)
			LuaFnSetXinFaLevel(sceneId,selfId,55,150)
			LuaFnSetXinFaLevel(sceneId,selfId,72,150)
			AddSkill(  sceneId, selfId, 23)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,0)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G少林#B门下，有了他的加入， #G少林#B比之前更为强大了！", 4 )
		end
	elseif key == 205  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 7)
			LuaFnSetXinFaLevel(sceneId,selfId,43,150)
			LuaFnSetXinFaLevel(sceneId,selfId,44,150)
			LuaFnSetXinFaLevel(sceneId,selfId,45,150)
			LuaFnSetXinFaLevel(sceneId,selfId,46,150)
			LuaFnSetXinFaLevel(sceneId,selfId,47,150)
			LuaFnSetXinFaLevel(sceneId,selfId,48,150)
			LuaFnSetXinFaLevel(sceneId,selfId,62,150)
			LuaFnSetXinFaLevel(sceneId,selfId,79,150)
			AddSkill(  sceneId, selfId, 30)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,7)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G天山#B门下，有了他的加入， #G天山#B比之前更为强大了！", 4 )
		end
	elseif key == 206  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 6)
			LuaFnSetXinFaLevel(sceneId,selfId,37,150)
			LuaFnSetXinFaLevel(sceneId,selfId,38,150)
			LuaFnSetXinFaLevel(sceneId,selfId,39,150)
			LuaFnSetXinFaLevel(sceneId,selfId,40,150)
			LuaFnSetXinFaLevel(sceneId,selfId,41,150)
			LuaFnSetXinFaLevel(sceneId,selfId,42,150)
			LuaFnSetXinFaLevel(sceneId,selfId,61,150)
			LuaFnSetXinFaLevel(sceneId,selfId,78,150)
			AddSkill(  sceneId, selfId, 29)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,6)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G天龙#B门下，有了他的加入， #G天龙#B比之前更为强大了！", 4 )
		end
	elseif key == 207  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 3)
			LuaFnSetXinFaLevel(sceneId,selfId,19,150)
			LuaFnSetXinFaLevel(sceneId,selfId,20,150)
			LuaFnSetXinFaLevel(sceneId,selfId,21,150)
			LuaFnSetXinFaLevel(sceneId,selfId,22,150)
			LuaFnSetXinFaLevel(sceneId,selfId,23,150)
			LuaFnSetXinFaLevel(sceneId,selfId,24,150)
			LuaFnSetXinFaLevel(sceneId,selfId,58,150)
			LuaFnSetXinFaLevel(sceneId,selfId,75,150)
			AddSkill(  sceneId, selfId, 26)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,3)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G武当#B门下，有了他的加入， #G武当#B比之前更为强大了！", 4 )
		end
	elseif key == 208  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 1)
			LuaFnSetXinFaLevel(sceneId,selfId,7,150)
			LuaFnSetXinFaLevel(sceneId,selfId,8,150)
			LuaFnSetXinFaLevel(sceneId,selfId,9,150)
			LuaFnSetXinFaLevel(sceneId,selfId,10,150)
			LuaFnSetXinFaLevel(sceneId,selfId,11,150)
			LuaFnSetXinFaLevel(sceneId,selfId,12,150)
			LuaFnSetXinFaLevel(sceneId,selfId,56,150)
			LuaFnSetXinFaLevel(sceneId,selfId,73,150)
			AddSkill(  sceneId, selfId, 24)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,1)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G明教#B门下，有了他的加入， #G明教#B比之前更为强大了！", 4 )
		end
	elseif key == 209  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 2)
			LuaFnSetXinFaLevel(sceneId,selfId,13,150)
			LuaFnSetXinFaLevel(sceneId,selfId,14,150)
			LuaFnSetXinFaLevel(sceneId,selfId,15,150)
			LuaFnSetXinFaLevel(sceneId,selfId,16,150)
			LuaFnSetXinFaLevel(sceneId,selfId,17,150)
			LuaFnSetXinFaLevel(sceneId,selfId,18,150)
			LuaFnSetXinFaLevel(sceneId,selfId,57,150)
			LuaFnSetXinFaLevel(sceneId,selfId,74,150)
			AddSkill(  sceneId, selfId, 25)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,2)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G丐帮#B门下，有了他的加入， #G丐帮#B比之前更为强大了！", 4 )
		end
	elseif key == 210  then
		if x300053_CheckJiaRuMenPai(sceneId,selfId) == 1 then
			LuaFnJoinMenpai(sceneId, selfId, selfId, 4)
			LuaFnSetXinFaLevel(sceneId,selfId,25,150)
			LuaFnSetXinFaLevel(sceneId,selfId,26,150)
			LuaFnSetXinFaLevel(sceneId,selfId,27,150)
			LuaFnSetXinFaLevel(sceneId,selfId,28,150)
			LuaFnSetXinFaLevel(sceneId,selfId,29,150)
			LuaFnSetXinFaLevel(sceneId,selfId,30,150)
			LuaFnSetXinFaLevel(sceneId,selfId,59,150)
			LuaFnSetXinFaLevel(sceneId,selfId,76,150)
			AddSkill(  sceneId, selfId, 27)
			x300053_JiaRuMenPaiAddItem(sceneId,selfId,4)
			LuaFnDelAvailableItem(sceneId,selfId,39910006,1)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			SetMissionData(sceneId, selfId, MY_JIARUMENPAI, 1);
			x300053_MsgBox( sceneId, selfId, "#Y恭喜您，成功加入了门派，祝您游戏愉快。" )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B通过了种种考核，拜入了#G峨眉#B门下，有了他的加入， #G峨眉#B比之前更为强大了！", 4 )
		end
	end
end
--**********************************
--兑换赠点
--**********************************
function x300053_GoldToZD( sceneId, selfId, toZDNum)
	local needMoney=toZDNum*1000;
	local	SelfMoney = GetMoney(sceneId, selfId)
	if SelfMoney<needMoney then
		local sMessage = format("#Y    金钱不足，请检查。")
		x399999_MsgBox( sceneId, selfId, sMessage )
		return
	end
	local reply = CostMoney(sceneId,selfId,needMoney)
	if reply == -1 then
		local sMessage = format("#Y    金钱不足，请检查。")
		x399999_MsgBox( sceneId, selfId, sMessage )
		return
	else
		local result =	ZengDian(sceneId,selfId,targetId,1,toZDNum)
		local sMessage = format("#Y恭喜您兑换成功。#r消耗了 [#R#{_MONEY%d}#Y]#r获得了 [#R%d赠点]",needMoney,toZDNum)
		x399999_MsgBox( sceneId, selfId, sMessage )
	end
end
--**********************************
--心法学习，点击学习按钮
--**********************************
function x300053_MRXinFa(sceneId,selfId,xinfaId,money,exp)
	if GetExp(sceneId,selfId) < exp  then
		x300053_Tips( sceneId, selfId, "经验不足，请检查！" )
		return
	elseif GetMoney(sceneId, selfId) < money  then
		x300053_Tips( sceneId, selfId, "金钱不足，请检查！" )
		return
	end
	local reply = CostMoney(sceneId,selfId,money)
	if reply ~= -1 then
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, xinfaId) + 1
		LuaFnAddExp(sceneId,selfId,0-exp)
		LuaFnSetXinFaLevel(sceneId,selfId,xinfaId,nXinfaLevel)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)
		--x300053_Tips( sceneId, selfId, nXinfaLevel.." 级心法学习成功!" )	
		DispatchXinfaLevelInfo( sceneId, selfId, selfId, 10 );
	end
end

--**********************************
--心法学习
--**********************************
function x300053_XinFa(sceneId,selfId)
	DispatchXinfaLevelInfo( sceneId, selfId, selfId, 10 );
end
