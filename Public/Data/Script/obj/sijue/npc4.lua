--��翷帱��....
--����ԶԻ��ű�....

--�ű���
x910004_g_ScriptId = 910004

--�����߼��ű���....
x910004_g_FuBenScriptId = 899993

--**********************************
--������ں���....
--**********************************
function x910004_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_06}" )
		AddNumText( sceneId, x910004_g_ScriptId, "��ս", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x910004_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x910004_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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

	--������ںͱ��BOSSս���򷵻�....
--	local ret, msg = CallScriptFunction( x910004_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
--	if 1 == ret then
--		BeginEvent(sceneId)
--			AddText( sceneId, msg )
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--		return
--	end
        local	lev	= GetLevel( sceneId, selfId )
		if ( lev>  110 ) then
		--����BOSS....
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910004_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan6_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo1_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo2_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo3_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo4_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo5_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo6_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo7_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo8_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo9_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo10_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--����BOSS....
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910004_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan5_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo1_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo2_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo3_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo4_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo5_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo6_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo7_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo8_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo9_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo10_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--����BOSS....
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910004_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan4_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo1_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo2_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo3_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo4_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo5_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo6_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo7_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo8_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo9_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo10_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--����BOSS....
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910004_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan3_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo1_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo2_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo3_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo4_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo5_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo6_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo7_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo8_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo9_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo10_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--����BOSS....
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910004_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan2_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo1_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo2_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo3_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo4_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo5_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo6_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo7_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo8_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo9_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo10_BOSS", -1, -1 )
		return

		elseif (lev<=70  	and lev>  1 ) then
		--����BOSS....
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910004_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan1_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo1_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo2_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo3_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo4_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo5_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo6_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo7_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo8_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo9_BOSS", -1, -1 )
		CallScriptFunction( x910004_g_FuBenScriptId, "CreateBOSS", sceneId, "xingluo10_BOSS", -1, -1 )
--		return
--	end
	--������翷��ʱ���������Լ�....
	CallScriptFunction( x910004_g_FuBenScriptId, "OpenPMFTimer", sceneId, 6, x910004_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x910004_OnPMFTimer( sceneId, step, data1, data2 )

	if 6 == step then
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 1 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x910004_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
--		CallScriptFunction( x910004_g_FuBenScriptId, "DeleteBOSS", sceneId, "ZhuoBuFan_NPC" )
		return
	end

--	if 1 == step then

	end

--end
end
