--新玄武岛活动的启动脚本

--脚本号
x808120_g_ScriptId	= 808120

--需要刷出的10只雷麟NPC，10只雏凤NPC的数据表....
x808120_g_BossData = {

	-- ID						BOSS的 monster id
	-- AIType				BOSS的AIType....
	-- AIScriptID	BOSS的AIScriptID....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreateNum		多少个....

	{ ID=13288, AIType=3, AIScriptID=-1, ScriptID=808121, NeedCreateNum=10, LifeTime=29*60*1000, Title = "千年奇兽"},   ----雷麟
	{ ID=13289, AIType=3, AIScriptID=-1, ScriptID=808121, NeedCreateNum=10, LifeTime=29*60*1000, Title = "千年奇兽" },
}

x808120_g_beginTime1 = 21*60 + 15
x808120_g_endTime1 = 21*60 + 44
x808120_g_beginTime2 = 21*60 + 45
x808120_g_endTime2 = 22*60 + 14
x808120_g_beginTime3 = 13*60 + 30
x808120_g_endTime3 = 13*60 + 59

x808120_g_type1 = 184   --13:30
x808120_g_type2 = 187   --18:30
x808120_g_type3 = 188   --19:00
x808120_g_type4 = 172   --21:45


--刷出怪的NPC坐标随机坐标--13:30 and 18：30
x808120_g_BossPosData = {
  --posX 随机点的X坐标 
  --posY 随机点的Y坐标 

  {posX = 186, posZ = 143},
  {posX = 136, posZ = 127},
  {posX = 69, posZ = 133},
  {posX = 142, posZ = 89},
  {posX = 174, posZ = 152},
  {posX = 151, posZ = 218},
  {posX = 168, posZ = 252},
  {posX = 108, posZ = 150},
  {posX = 65, posZ = 146},
  {posX = 126, posZ = 37},  --10
  {posX = 173, posZ = 159},
  {posX = 88, posZ = 150},
  {posX = 136, posZ = 153},
  {posX = 121, posZ = 80},
  {posX = 178, posZ = 78},
  {posX = 163, posZ = 203},
  {posX = 119, posZ = 178},
  {posX = 151, posZ = 132},
  {posX = 155, posZ = 49},
  {posX = 164, posZ = 230},
}


--刷出怪的NPC坐标随机坐标---第二批  19:00 and 21:45
x808120_g_BossPosData2 = {
  --posX 随机点的X坐标 
  --posY 随机点的Y坐标 

  {posX = 99, posZ = 197},
  {posX = 38, posZ = 219},
  {posX = 97, posZ = 235},
  {posX = 81, posZ = 83},
  {posX = 78, posZ = 48},
  {posX = 239, posZ = 51},
  {posX = 247, posZ = 89},
  {posX = 242, posZ = 111},
  {posX = 225, posZ = 235},
  {posX = 260, posZ = 263},  --10
  {posX = 65, posZ = 197},
  {posX = 53, posZ = 226},
  {posX = 56, posZ = 82},
  {posX = 28, posZ = 53},
  {posX = 39, posZ = 48},
  {posX = 254, posZ = 41},
  {posX = 235, posZ = 96},
  {posX = 240, posZ = 221},
  {posX = 238, posZ = 225},
  {posX = 290, posZ = 267},
}

--**********************************
--脚本入口函数
--**********************************
function x808120_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

  local objId = 0
  if actId == x808120_g_type1 then
		for i, BossData in x808120_g_BossData do
			for j = 0, BossData.NeedCreateNum-1 do
		  	 objId = LuaFnCreateMonster( sceneId, BossData.ID, x808120_g_BossPosData[(i-1)*10+j+1].posX, x808120_g_BossPosData[(i-1)*10+j+1].posZ, BossData.AIType, BossData.AIScriptID, BossData.ScriptID )
		  	 SetCharacterDieTime(sceneId, objId, BossData.LifeTime )
		  	 SetCharacterTitle(sceneId, objId, BossData.Title)
			end	
		end	
	elseif actId == x808120_g_type2 then
		for i, BossData in x808120_g_BossData do
			for j = 0, BossData.NeedCreateNum-1 do
		  	 objId = LuaFnCreateMonster( sceneId, BossData.ID, x808120_g_BossPosData[(i-1)*10+j+1].posX, x808120_g_BossPosData[(i-1)*10+j+1].posZ, BossData.AIType, BossData.AIScriptID, BossData.ScriptID )
		  	 SetCharacterDieTime(sceneId, objId, BossData.LifeTime )
		  	 SetCharacterTitle(sceneId, objId, BossData.Title)
			end	
		end
	elseif actId == x808120_g_type3 then
		for i, BossData in x808120_g_BossData do
			for j = 0, BossData.NeedCreateNum-1 do
		  	 objId = LuaFnCreateMonster( sceneId, BossData.ID, x808120_g_BossPosData2[(i-1)*10+j+1].posX, x808120_g_BossPosData2[(i-1)*10+j+1].posZ, BossData.AIType, BossData.AIScriptID, BossData.ScriptID )
		  	 SetCharacterDieTime(sceneId, objId, BossData.LifeTime )
		  	 SetCharacterTitle(sceneId, objId, BossData.Title)
			end	
		end	
	elseif actId == x808120_g_type4 then
		for i, BossData in x808120_g_BossData do
			for j = 0, BossData.NeedCreateNum-1 do
		  	 objId = LuaFnCreateMonster( sceneId, BossData.ID, x808120_g_BossPosData2[(i-1)*10+j+1].posX, x808120_g_BossPosData2[(i-1)*10+j+1].posZ, BossData.AIType, BossData.AIScriptID, BossData.ScriptID )
		  	 SetCharacterDieTime(sceneId, objId, BossData.LifeTime )
		  	 SetCharacterTitle(sceneId, objId, BossData.Title)
			end	
		end	
	end
	
end

--**********************************
--心跳函数
--**********************************
function x808120_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	--if CheckActiviyValidity( sceneId, actId ) == 0 then
	--	StopOneActivity( sceneId, actId )
	--end

end

--返回值：
--0：不是活动时间
--1：21：15分到21：44活动
--2：21：45到22：14
--3：13：30到13：59
--后来调整活动时间没有继续更新本函数，所以如果使用请先检查正确
function x808120_IsActivityOpen(sceneId)
	local nHour = GetHour();
	local nMinute = GetMinute();
	local nCurTempTime = nHour * 60 + nMinute;
	if nCurTempTime >= x808120_g_beginTime1 and nCurTempTime < x808120_g_endTime1 then
		return 1;
	elseif nCurTempTime >= x808120_g_beginTime2 and nCurTempTime < x808120_g_endTime2 then
		return 2;
	elseif nCurTempTime >= x808120_g_beginTime3 and nCurTempTime < x808120_g_endTime3 then
		return 3;
	end
	return 0;
end
