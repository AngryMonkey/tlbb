--��翷帱��....
--�����ǶԻ��ű�....

--�ű���
x402078_g_ScriptId = 402078

--�����߼��ű���....
x402078_g_FuBenScriptId = 402082

--����buff��....
x402078_g_ZhenSheBuffTbl = { 10264, 10265, 10266 }
--��Ȥbuff��....
x402078_g_YouQuBuffTbl = { 10261, 10262, 10263 }


--**********************************
--������ں���....
--**********************************
function x402078_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "    #���Ȼ��վ���ҵ���ǰ��֤���㻹��Щʵ�������ҽ�����ͷ���£����ɺ����͸�Ү�����ǽ�������������..." )

		--�жϵ�ǰ�Ƿ������ս˫��....	
		if 1 == CallScriptFunction( x402078_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ZhuoBuFan" ) then
			AddNumText( sceneId, x402078_g_ScriptId, "��ս", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402078_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x402078_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
	if 1 ~= CallScriptFunction( x402078_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ZhuoBuFan" ) then
		return
	end

	--������ںͱ��BOSSս���򷵻�....
--	local ret, msg = CallScriptFunction( x402078_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
--	if 1 == ret then
--		BeginEvent(sceneId)
--			AddText( sceneId, msg )
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--		return
--	end
        local	lev	= GetLevel( sceneId, selfId )
		if (lev<=120  	and lev>  110 ) then
		--����BOSS....
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402078_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan5_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--����BOSS....
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402078_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan4_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--����BOSS....
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402078_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan3_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--����BOSS....
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402078_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan2_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei5_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--����BOSS....
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402078_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan1_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "huozhenshouwei5_BOSS", -1, -1 )
	--������翷��ʱ���������Լ�....
	CallScriptFunction( x402078_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402078_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x402078_OnPMFTimer( sceneId, step, data1, data2 )


	if 7 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_16}" )
		x402078_UseZhenShe( sceneId )
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_17}" )
		x402078_UseYouQu( sceneId )
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x402078_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
--		CallScriptFunction( x402078_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		return
	end

	if 1 == step then
		--����BOSS....
--		CallScriptFunction( x402078_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan1_BOSS", -1, -1 )
		return
	end

end
end

--**********************************
--��������....
--**********************************
function x402078_UseZhenShe( sceneId )

	local bossId = CallScriptFunction( x402078_g_FuBenScriptId, "FindBOSS", sceneId, "ZhuoBuFan_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x402078_g_ZhenSheBuffTbl) )
	local buffId = x402078_g_ZhenSheBuffTbl[idx]

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
function x402078_UseYouQu( sceneId )

	local bossId = CallScriptFunction( x402078_g_FuBenScriptId, "FindBOSS", sceneId, "ZhuoBuFan_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x402078_g_YouQuBuffTbl) )
	local buffId = x402078_g_YouQuBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end
