--��翷帱��....
--����ԶԻ��ű�....

--�ű���
x910002_g_ScriptId = 910002

--�����߼��ű���....
x910002_g_FuBenScriptId = 899991

--**********************************
--������ں���....
--**********************************
function x910002_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_06}" )
		AddNumText( sceneId, x910002_g_ScriptId, "��ս", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x910002_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x910002_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
--	local ret, msg = CallScriptFunction( x910002_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
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
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910002_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x910002_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong6_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--����BOSS....
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910002_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x910002_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong5_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--����BOSS....
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910002_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x910002_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong4_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--����BOSS....
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910002_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x910002_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong3_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--����BOSS....
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910002_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x910002_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong2_BOSS", -1, -1 )
		return

		elseif (lev<=70  	and lev>  1 ) then
		--����BOSS....
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910002_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x910002_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong1_BOSS", -1, -1 )
--		return
--	end
	--������翷��ʱ���������Լ�....
	CallScriptFunction( x910002_g_FuBenScriptId, "OpenPMFTimer", sceneId, 6, x910002_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x910002_OnPMFTimer( sceneId, step, data1, data2 )

	if 6 == step then
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 1 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x910002_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
--		CallScriptFunction( x910002_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		return
	end

--	if 1 == step then

	end

--end
end
