--��翷帱��....
--����ԶԻ��ű�....

--�ű���
x910001_g_ScriptId = 910001

--�����߼��ű���....
x910001_g_FuBenScriptId = 002939

--**********************************
--������ں���....
--**********************************
function x910001_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_06}" )
		AddNumText( sceneId, x910001_g_ScriptId, "��ս", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x910001_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x910001_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
--	local ret, msg = CallScriptFunction( x910001_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
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
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910001_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa6_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei5_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou5_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--����BOSS....
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910001_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa5_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei5_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou5_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--����BOSS....
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910001_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei5_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou5_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--����BOSS....
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910001_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei5_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou5_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--����BOSS....
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910001_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei5_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou5_BOSS", -1, -1 )
		return

		elseif (lev<=70  	and lev>  1 ) then
		--����BOSS....
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
		CallScriptFunction( x910001_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "huwei5_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou1_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou2_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou3_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou4_BOSS", -1, -1 )
		CallScriptFunction( x910001_g_FuBenScriptId, "CreateBOSS", sceneId, "jiaotou5_BOSS", -1, -1 )
--		return
--	end
	--������翷��ʱ���������Լ�....
	CallScriptFunction( x910001_g_FuBenScriptId, "OpenPMFTimer", sceneId, 6, x910001_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x910001_OnPMFTimer( sceneId, step, data1, data2 )

	if 6 == step then
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 1 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x910001_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
		--ɾ��NPC....
--		CallScriptFunction( x910001_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		return
	end

--	if 1 == step then

	end

--end
end