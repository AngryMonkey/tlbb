--��翷帱��....
--����ԶԻ��ű�....

--�ű���
x910003_g_ScriptId = 910003

--�����߼��ű���....
x910003_g_FuBenScriptId = 899992

--**********************************
--������ں���....
--**********************************
function x910003_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_06}" )
		AddNumText( sceneId, x910003_g_ScriptId, "��ս", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x910003_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x910003_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
--	local ret, msg = CallScriptFunction( x910003_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
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
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa6_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--����BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--����BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--����BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--����BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=70  	and lev>  1 ) then
		--����BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
--		return
--	end
	--������翷��ʱ���������Լ�....
	CallScriptFunction( x910003_g_FuBenScriptId, "OpenPMFTimer", sceneId, 6, x910003_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x910003_OnPMFTimer( sceneId, step, data1, data2 )

	if 6 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 1 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
--		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		return
	end

--	if 1 == step then

	end

--end
end
