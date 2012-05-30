-- 年兽BOSS死亡，掉落宝箱

x050051_g_ScriptId	= 050051
--x050051_g_strDieNotice = "年兽，年兽，年年有罪受。今年，凶猛嚣张狂妄可怜的年兽被%s“Pia”的一记鞭炮击中头部，炸得是昏天又暗地，忍不住的流星！只好如往年一样，落荒而逃！"
x050051_g_strDieNotice = ""
x050051_g_strDieNotice0 = "#{NSBS_20071228_08}"
x050051_g_strDieNotice1 = "#{NSBS_20071228_09}"

--x050051_g_strDropNotice = "#{NSBS_20071228_12}"

x050051_g_PosTbl = {

	--{{147,129},{140,129}},
	{155,57},	{141,43},
	{65,60},	{117,85},
	{198,75},	{239,51},
	{63,111},	{111,106},
	{180,120},{51,165},
	{139,152},{193,152},
	{72,195}, {127,201},
	{176,191},{52,263},
	{102,241},{155,255},
	{189,235},{240,241},
}

x050051_g_DropNum = 0;

--生长点id
x050051_g_GrowPointID = 780
--**********************************
--生成宝箱
--**********************************
function x050051_DropNianShouBox( sceneId)
	
	local index = random(20)
	
	local Pos = x050051_g_PosTbl[index]
	--给物品
	x050051_DropNianShouBoxEx(sceneId, Pos)
	
end


function x050051_DropNianShouBoxEx( sceneId, Pos)

	x050051_g_DropNum = x050051_g_DropNum + 1
	
	if x050051_g_DropNum > 60 then 
		return
	end
	
	local strMsg0 = "#{NSBS_20071228_14}"
	local strMsg1 = format("（%d，%d）", Pos[1], Pos[2])
	local strMsg2 = "#{NSBS_20071228_15}"
	local strMsg = strMsg0..strMsg1..strMsg2
	MonsterTalk(sceneId, -1, "无量山", strMsg)
			
	local ItemBoxId = ItemBoxEnterScene( Pos[1], Pos[2], x050051_g_GrowPointID, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30501157 )
	
	AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501158)
	
	local rand = random(100)
	if rand < 26 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30505107)
	end
	
	rand = random(100)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501159)
	end
	
	rand = random(100)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501160)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141105)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141106)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141107)
	end
	
	rand = random(1000)
	if rand < 16 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141108)
	end
	
	rand = random(1000)
	if rand < 7 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141109)
	end
		
	rand = random(1000)
	if rand < 7 then
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141110)
	end
	
	SetItemBoxMaxGrowTime( sceneId, ItemBoxId, 5400000 )
end

function x050051_OnDie( sceneId, selfId, killerId )
	--1.给杀死者加经验
	local level = GetLevel( sceneId, killerId )
	local expkill = (level*80-326)*10
	AddExp(sceneId, killerId, expkill)
	
	--发送醒目提示
--	BeginEvent( sceneId )
		--local str = format("你获得了经验%d", expkill)
		--AddText( sceneId,  str)
	--EndEvent( sceneId )
	--DispatchMissionTips( sceneId, selfId )
	
	--2.需要给所有人加经验，杀boss者更多经验
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		local level = GetLevel( sceneId, nHumanId )
		
		if nHumanId ~= killerId and level >= 10 then
		
			local expother = (level*80-326)*4
			AddExp(sceneId, nHumanId, expother)
		
			--发送醒目提示
			--BeginEvent( sceneId )
			--	local str1 = format("你获得了经验%d", expother)
			--	AddText( sceneId,  str1)
		--	EndEvent( sceneId )
		--	DispatchMissionTips( sceneId, nHumanId)
		end
	end
	
	--3.掉落宝箱，生成生长点
	local index = random(20)
	local index1 = random(20)
	
	--随机出两个相等的生长点，处理一下
	if index == index1 then 
		if index < 20 then
	   	index1 = index+1
	  else
	  	index1 = index-1
	  end
	end
	
	--生成第一个宝箱
	local Pos = x050051_g_PosTbl[index]
	x050051_DropNianShouBoxEx(sceneId, Pos)
	--生成第二个宝箱
	local Pos1 = x050051_g_PosTbl[index1]
	x050051_DropNianShouBoxEx(sceneId, Pos1)
	
	--死亡公告
	local str = format( "#{_INFOUSR%s}", GetName(sceneId,killerId))
	str = x050051_g_strDieNotice0..str..x050051_g_strDieNotice1
	
	BroadMsgByChatPipe( sceneId, killerId, str, 4 )
	
	--掉落公告
	--BroadMsgByChatPipe( sceneId, killerId, x050051_g_strDropNotice, 4 )
end

function x050051_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--LuaFnNpcChat(sceneId, selfId, 0, "不知死活的家伙，我的手下就能干掉你！")
end

function x050051_OnInit(sceneId, selfId)

end

function x050051_OnKillCharacter(sceneId, selfId, targetId)
	--LuaFnNpcChat(sceneId, selfId, 0, "我杀死一个人了....去死吧你....")
end

function x050051_OnEnterCombat(sceneId, selfId, enmeyId)
	--LuaFnNpcChat(sceneId, selfId, 0, "我进入战斗了....你们等着去找孟婆吧....")
	
end

function x050051_OnLeaveCombat(sceneId, selfId)
	--LuaFnNpcChat(sceneId, selfId, 0, "我离开战斗了....大家先停下吃点药吧....")
	
end

--创建一个小怪....
--function x050051_CreateChildMonster(sceneId, selfId, CreateData)

	--local PosX, PosY = LuaFnGetWorldPos( sceneId, selfId )
	--local PosNum = getn( x050051_MonsterPosTbl )
--	local PosIndex = random( PosNum )
	--PosX = PosX + x050051_MonsterPosTbl[PosIndex].x
	---PosY = PosY + x050051_MonsterPosTbl[PosIndex].y

	--MonId = LuaFnCreateMonster(sceneId, CreateData.ChildID, PosX, PosY, CreateData.BaseAI, CreateData.ExtAIScript, CreateData.ScriptID )
	--if CreateData.LifeTime > 0 then
	--	SetCharacterDieTime(sceneId, MonId, CreateData.LifeTime )
	--end

--end
