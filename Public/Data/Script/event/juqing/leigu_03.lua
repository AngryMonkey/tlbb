-- ��Ӯ�ɰ�˭���� 200042


-- ���ڸ��������ɱ������

--************************************************************************
--MisDescBegin
--�ű���
x200042_g_ScriptId = 200042

--��������
x200042_g_CopySceneName="�޹�ɽ"

--�����
x200042_g_MissionId = 35

--ǰ������
x200042_g_PreMissionId = 34

--Ŀ��NPC
x200042_g_Name = "���Ǻ�"

--�Ƿ��Ǿ�Ӣ����
x200042_g_IfMissionElite = 1

--����ȼ�
x200042_g_MissionLevel = 60

--�������
x200042_g_MissionKind = 53

--�����ı�����
x200042_g_MissionName="��Ӯ�ɰ�˭����"
x200042_g_MissionInfo="#{Mis_juqing_0035}"
x200042_g_MissionTarget="#{Mis_juqing_Tar_0035}"	--����Ŀ��
x200042_g_MissionComplete="  �벻����С���о�Ȼ�⿪��������֣����ǺӸм�������������δ�ܵóѣ����������һ�빦�͡�"	--�������npc˵���Ļ�
x200042_g_MissionContinue="  û�뵽��û�뵽�����������Ȼ���߳���������"

x200042_g_MoneyBonus=21600
x200042_g_exp=60000

x200042_g_RadioItemBonus={{id=10414013 ,num=1},{id=10414014,num=1},{id=10414015,num=1}}

x200042_g_Custom	= { {id="�ѱ�������",num=1} }
x200042_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200042_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200042_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200042_g_MissionName)
			AddText(sceneId,x200042_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200042_g_MoneyBonus )
		EndEvent( )
		bDone = x200042_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200042_g_ScriptId,x200042_g_MissionId,bDone)
    --���������������
  elseif x200042_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200042_g_MissionName)
			AddText(sceneId,x200042_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200042_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200042_g_MoneyBonus )
			for i, item in x200042_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200042_g_ScriptId,x200042_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200042_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200042_g_MissionId) > 0 then
		return
	end
  
  --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200042_g_MissionId) > 0 then
		AddNumText(sceneId,x200042_g_ScriptId,x200042_g_MissionName,2,-1);
	--���������������
	elseif x200042_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200042_g_ScriptId,x200042_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200042_CheckAccept( sceneId, selfId )
	
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) < 60 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200042_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200042_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200042_g_MissionId, x200042_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200042_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	Msg2Player(  sceneId, selfId,"#Y����������Ӯ�ɰ�˭����",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200042_g_SignPost.x, x200042_g_SignPost.z, x200042_g_SignPost.tip )
	
	-- ������ ��ʼ���飬�����ڸ�����OnTime�����
	LuaFnSetCopySceneData_Param(sceneId, 8, 2) ;--����˵��
	LuaFnSetCopySceneData_Param(sceneId, 9, LuaFnGetCurrentTime())--ʱ��
	LuaFnSetCopySceneData_Param(sceneId, 10, 1) ;--����˵����
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())--ʱ��
	
end

--**********************************
--��ʱ�¼�
--**********************************
function x200042_OnTimer(sceneId,selfId)
	
end

--**********************************
--����
--**********************************
function x200042_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200042_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200042_g_SignPost.tip )
end


--**********************************
--����
--**********************************
function x200042_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200042_g_MissionName)
		AddText(sceneId,x200042_g_MissionComplete)
		AddMoneyBonus( sceneId, x200042_g_MoneyBonus )
		for i, item in x200042_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200042_g_ScriptId,x200042_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200042_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200042_g_MissionId)			--�õ���������к�

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200042_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local Kill1 = LuaFnGetCopySceneData_Param(sceneId, 15)
	if Kill1 ~= 1   then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200042_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200042_CheckSubmit(sceneId, selfId) == 1    then
  	BeginAddItem(sceneId)
		for i, item in x200042_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret < 1 then
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)

		AddMoney(sceneId,selfId,x200042_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200042_g_exp)

		DelMission( sceneId, selfId, x200042_g_MissionId )
		MissionCom( sceneId, selfId, x200042_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y���������Ӯ�ɰ�˭����",MSG2PLAYER_PARA )

		-- ���ú�������
		CallScriptFunction((200043), "OnDefaultEvent",sceneId, selfId, targetId )
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 2 then
			LuaFnSetCopySceneData_Param(sceneId, 8, 3)
		end
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200042_OnKillObject( sceneId, selfId, objdataId ,objId)

end

--**********************************
--���������¼�
--**********************************
function x200042_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200042_OnItemChanged( sceneId, selfId, itemdataId )
end
