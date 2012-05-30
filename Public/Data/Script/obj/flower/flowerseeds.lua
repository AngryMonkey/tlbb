--�ʻ�������
--����С����ʱ����
--�ű���
x000174_g_scriptId = 000174

x000174_g_ItemId = 30309813

x000174_g_PlantingFlowersScriptId = 000175

x000174_g_minValue = 6000
x000174_g_maxValue = 9000

x000174_g_SceneMapDefine = {	
										{sceneId=18,	sceneName="����",	CorpseMonsterId=3512},
										{sceneId=19,	sceneName="�㱱",	CorpseMonsterId=3513},
										{sceneId=20,	sceneName="��ԭ",	CorpseMonsterId=3515},
										{sceneId=21,	sceneName="����",	CorpseMonsterId=3516},
										{sceneId=22,	sceneName="����ɽ",	CorpseMonsterId=3518},
										{sceneId=23,	sceneName="������",	CorpseMonsterId=3519},
										{sceneId=24,	sceneName="����",	CorpseMonsterId=3511},
										{sceneId=25,	sceneName="��ɽ",	CorpseMonsterId=3513},
										{sceneId=26,	sceneName="ʯ��",	CorpseMonsterId=3514},
										{sceneId=27,	sceneName="��Ϫ",	CorpseMonsterId=3516},
										{sceneId=28,	sceneName="��گ",	CorpseMonsterId=3517},
										{sceneId=29,	sceneName="�置",	CorpseMonsterId=3518},
										{sceneId=30,	sceneName="����",	CorpseMonsterId=3511},
										{sceneId=31,	sceneName="��Ȫ",	CorpseMonsterId=3512},
										{sceneId=32,	sceneName="����",	CorpseMonsterId=3514},
										{sceneId=33,	sceneName="÷��",	CorpseMonsterId=3515},
										{sceneId=34,	sceneName="�Ϻ�",	CorpseMonsterId=3517},
										{sceneId=35,	sceneName="����",	CorpseMonsterId=3518},
									}
								 
x000174_g_GhoulMonsterTable = {
												{level=11, id=42130},{level=21, id=42131},
												{level=31, id=42132},{level=41, id=42133},
												{level=51, id=42134},{level=61, id=42135},
												{level=71, id=42136},{level=81, id=42137},
												{level=91, id=42138},{level=101, id=42139},
												{level=111, id=42140},{level=121, id=42141},
												{level=131, id=42142},{level=141, id=42143},
												{level=151, id=42144},{level=161, id=42145},
												{level=171, id=42146},{level=181, id=42147},
												{level=191, id=42148},{level=201, id=42149},
											}									 
									 
--**********************************
--�õ�item�Ĳ�����Ϣ
--**********************************
function x000174_GetItemParam(sceneId, selfId, BagPos)							
	--local BagPos = GetBagPosByItemSn(sceneId, selfId, x000174_g_ItemId)
	--PrintNum(BagPos)
	local targetsceneId = GetBagItemParam(sceneId, selfId, BagPos, 1, 1)
	--PrintNum(targetsceneId)
	local targetX = GetBagItemParam(sceneId, selfId, BagPos, 3, 1)
	--PrintNum(targetX)
  local targetZ = GetBagItemParam(sceneId, selfId, BagPos, 5, 1)
  --PrintNum(targetZ)
  local r = GetBagItemParam(sceneId, selfId, BagPos, 7, 1)
  return targetsceneId, targetX, targetZ, r
end

--**********************************
--��ֲ�ɹ� --OK
--**********************************
function x000174_DiscoverGhoulMonster(sceneId, selfId)
	local humanLevel = LuaFnGetLevel(sceneId, selfId)
	local dataId = x000174_g_GhoulMonsterTable[1].id
	local ct = getn(x000174_g_GhoulMonsterTable)
	for i=1, ct do
		if humanLevel >= x000174_g_GhoulMonsterTable[i].level then
			dataId = x000174_g_GhoulMonsterTable[i].id
		end
	end

	local aifile = random(10)
	local x, z = GetWorldPos(sceneId, selfId)
	local MonsterId = LuaFnCreateMonster(sceneId, dataId, x, z-2, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, humanLevel+(random(2)-random(2)) )
	SetCharacterDieTime(sceneId, MonsterId, 60*60000)

	local strTitle, strName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "CreateTitleAndName_ForCangBaoTu", sceneId, selfId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			
		
	BeginEvent(sceneId)		
		AddText(sceneId, "�ʻ�������ֲ�ɹ�");

	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
       local _, sceneName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "GetScenePosInfo", sceneId,sceneId)
		
	local playerName = GetName(sceneId,selfId)
	local strText = format("#cFF0000�����Ӿ���#W��������#c00ffff[��˹õ��]#W������#G%s#W��������������ţ����ϱ�#cff6633#{_INFOUSR%s}#W�������о��ѣ�", 
				sceneName,playerName )

	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	
end

--**********************************
--���ݳ���Id�ó���Ӧ��ID
--**********************************
function x000174_GetDataIDbySceneID(sceneId)
		for i, SceneMapInfo in x000174_g_SceneMapDefine do
			if SceneMapInfo.sceneId == sceneId then
				return SceneMapInfo.CorpseMonsterId
			end
		end
		return x000174_g_DefaultCorpseDataId
end

--**********************************
--Ĭ���¼�
--**********************************
function x000174_OnDefaultEvent( sceneId, selfId, BagPos)
	
	-- /////////////////////////////////////////////////////////////////
	-- ��ȡ����Ʒ�����ݣ������Ĭ��ֵ0��˵���ǵ�һ��ʹ�ã�������������
	-- ����Ѿ���������ʲô������
	local targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the first time .... nil nil nil")
		--������������
		CallScriptFunction(x000174_g_PlantingFlowersScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--���»�ȡ��Ʒ����
		targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	end
	-- ��ЩBT ��������һ�μ��
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the second time .... nil nil nil")
		--������������
		CallScriptFunction(x000174_g_PlantingFlowersScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--���»�ȡ��Ʒ����
		targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	end
	--�������ָ���ĳ���, ָ��������͵����Ի�����ʾ���ȥ�Ķ��Ķ��Ķ�
	local sceneName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "GetSceneName", sceneId, selfId, targetSceneId)
	-- /////////////////////////////////////////////////////////////////
	
	--local sceneName = GetSceneName(targetSceneId)
	--PrintStr(sceneName)
	local strText = format("����Ҫ������ʻ�����������#R%s#c66ccff[%d,%d]", sceneName, targetX, targetZ)
	
	--ȡ����ҵ�ǰ����
	local PlayerX = GetHumanWorldX(sceneId, selfId)
	local PlayerZ = GetHumanWorldZ(sceneId, selfId)
	--���������Ŀ���ľ���
	local Distance = floor(sqrt((targetX-PlayerX)*(targetX-PlayerX)+(targetZ-PlayerZ)*(targetZ-PlayerZ)))
	--print(PlayerX,PlayerZ)

	if targetSceneId ~= sceneId or Distance > r then
		--print(sceneId,selfId,targetId)
		BeginEvent(sceneId)
			AddText(sceneId, strText);
			AddText(sceneId, "#G�������#cffcc88�ʻ������Ǻ��������������澫�飬��Ҫ���ð�ϧ���˲���������ᣬ����õ�����#c66ccff[��˹õ��]#cffcc88�Ժ����������ġ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)

		--test code begin
		--EraseItem( sceneId, selfId, BagPos )
		--test cod end
		return
	end	
	
	--ɾ������Ʒ
	if LuaFnIsItemAvailable(sceneId, selfId, BagPos) <= 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "������Ʒ���ڲ����û��ѱ�������")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)	
		return	
	end	
	
	--PrintStr("begin random...")
	--�����ʹ�÷�Χ, ��������������¼������ۼ��ʶ��ٶ�����ֲ�ɹ���
	local ret = random(100)
	if ret < 30 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 40 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 80 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
		if retval == 0 then
		  --��¼ͳ����Ϣ
	    LuaFnAuditWaBao(sceneId, selfId)
			return
		end
	elseif ret < 85 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 95 then --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	else --��ֲ�ɹ�
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	end
	
  EraseItem( sceneId, selfId, BagPos )
	
	--��¼ͳ����Ϣ
	LuaFnAuditWaBao(sceneId, selfId)
		
end

function x000174_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
