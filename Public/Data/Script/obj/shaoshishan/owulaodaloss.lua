--��翷帱��....
--ս�����ϴ�Ի��ű�....

--�ű���
x890075_g_ScriptId = 890075

--�����߼��ű���....
x890075_g_FuBenScriptId = 890063


--**********************************
--������ں���....
--**********************************
function x890075_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "���˶���������ս�����ȴ������������˵�ɣ�ҪС�ı��˵�ȫ������Ŷ!" )

		--�жϵ�ǰ�Ƿ������ս����ˮ....	
		if 1 == CallScriptFunction( x890075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
			AddNumText( sceneId, x890075_g_ScriptId, "��ս�����", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x890075_OnEventRequest( sceneId, selfId, targetId, eventId )

	--������ڼ���BOSS�򷵻�....
	if 1 == CallScriptFunction( x890075_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
	if 1 ~= CallScriptFunction( x890075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
		return
	end

	--������ںͱ��BOSSս���򷵻�....
	local ret, msg = CallScriptFunction( x890075_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--������翷��ʱ���������Լ�....
	CallScriptFunction( x890075_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x890075_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ����OnTimer....
--**********************************
function x890075_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��5���Ӻ�ʼ" )
		return
	end

	if 6 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��4���Ӻ�ʼ" )
		return
	end

	if 5 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��3���Ӻ�ʼ" )
		return
	end

	if 4 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��2���Ӻ�ʼ" )
		return
	end

	if 3 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "ս��1���Ӻ�ʼ" )
		return
	end

	if 2 == step then
		--��ʾս����ʼ....
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "ս����ʼ" )
	--local nMonsterNum = GetMonsterCount(sceneId)
	--for i=0, nMonsterNum-1 do
		--local MonsterId = GetMonsterObjID(sceneId,i)
		--if 42206 == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			--LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			--SetCharacterDieTime( sceneId, MonsterId, 1000 )
		--end
	--end
		--CallScriptFunction( x890075_g_FuBenScriptId, "DeleteBOSS", sceneId, "MuRongFuLoss_NPC" )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x890075_g_FuBenScriptId, "CreateBOSS", sceneId, "DingChunQiu_BOSS", -1, -1 )
		return
	end

end
