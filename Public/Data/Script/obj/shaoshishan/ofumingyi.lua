--��翷帱��....
--�����ǶԻ��ű�....

--�ű���
x890073_g_ScriptId = 890073

--�����߼��ű���....
x890073_g_FuBenScriptId = 890063

--����buff��....
x890073_g_ZhenSheBuffTbl = { 10264, 10265, 10266 }
--��Ȥbuff��....
x890073_g_YouQuBuffTbl = { 10261, 10262, 10263 }


--**********************************
--������ں���....
--**********************************
function x890073_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "����Ҫ��������ɽ���㣬�����ȴ��ׯ���ͺ�Ľ�ݸ���������������ȡս������" )

		--�жϵ�ǰ�Ƿ������ս˫��....	
		if 1 == CallScriptFunction( x890073_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
			AddNumText( sceneId, x890073_g_ScriptId, "��ս�����ɷ", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x890073_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x890073_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
		return
	end

	--�ǲ��Ƕӳ�....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�жϵ�ǰ�Ƿ������ս˫��....	
	if 1 ~= CallScriptFunction( x890073_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
		return
	end

	--������ںͱ��BOSSս���򷵻�....
	local ret, msg = CallScriptFunction( x890073_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--������翷��ʱ���������Լ�....
	CallScriptFunction( x890073_g_FuBenScriptId, "OpenPMFTimer", sceneId, 16, x890073_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x890073_OnPMFTimer( sceneId, step, data1, data2 )

	if 16 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_165}" )
		return
	end

	if 13 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_164}" )
		return
	end

	if 10 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_170}" )
		return
	end

	if 7 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_181}" )
		x890073_UseZhenShe( sceneId )
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 6 == step then
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080530_04}" )
		x890073_UseYouQu( sceneId )
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x890073_g_FuBenScriptId, "CreateBOSS", sceneId, "YaoBoDang_BOSS", -1, -1 )
		CallScriptFunction( x890073_g_FuBenScriptId, "CreateBOSS", sceneId, "SiMaLing_BOSS", -1, -1 )
		return
	end

end

--**********************************
--��������....
--**********************************
function x890073_UseZhenShe( sceneId )

	local bossId = CallScriptFunction( x890073_g_FuBenScriptId, "FindBOSS", sceneId, "LiFan_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x890073_g_ZhenSheBuffTbl) )
	local buffId = x890073_g_ZhenSheBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end

--**********************************
--������Ȥ....
--**********************************
function x890073_UseYouQu( sceneId )

	local bossId = CallScriptFunction( x890073_g_FuBenScriptId, "FindBOSS", sceneId, "LiFan_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x890073_g_YouQuBuffTbl) )
	local buffId = x890073_g_YouQuBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end
