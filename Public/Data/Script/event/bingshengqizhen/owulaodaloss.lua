--��翷帱��....
--ս�����ϴ�Ի��ű�....

--�ű���
x402092_g_ScriptId = 402092

--�����߼��ű���....
x402092_g_FuBenScriptId = 402080


--**********************************
--������ں���....
--**********************************
function x402092_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "    #��Ȼ������ԭ��վ���ҵ���ǰ��һ����������ϧ������������㳢��������������~~������......" )

		--�жϵ�ǰ�Ƿ������ս����ˮ....	
		if 1 == CallScriptFunction( x402092_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
			AddNumText( sceneId, x402092_g_ScriptId, "��սҮ�����ǣ�", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402092_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x402092_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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

	--�жϵ�ǰ�Ƿ������ս����ˮ....	
	if 1 ~= CallScriptFunction( x402092_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
		return
	end

	--������ںͱ��BOSSս���򷵻�....
--	local ret, msg = CallScriptFunction( x402092_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
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
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui5_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--����BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui4_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--����BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui3_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--����BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui2_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--����BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui1_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
	--������翷��ʱ���������Լ�....
	CallScriptFunction( x402092_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402092_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x402092_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
--		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		return
	end

	if 1 == step then
		--����BOSS....
--		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui1_BOSS", -1, -1 )
		return
	end

end
end