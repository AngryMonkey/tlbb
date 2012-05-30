-- Ѫս����ׯ


-- 200024
-- ��������

-- ���ڸ��������ɱ������

--************************************************************************
--MisDescBegin
--�ű���
x200024_g_ScriptId = 200024

--��������
x200024_g_CopySceneName="����ׯ"

--�����
x200024_g_MissionId = 23

--ǰ������
x200024_g_PreMissionId = 22

--Ŀ��NPC
x200024_g_Name = "ѦĽ��"

--�Ƿ��Ǿ�Ӣ����
x200024_g_IfMissionElite = 1

--����ȼ�
x200024_g_MissionLevel = 40

--�������
x200024_g_MissionKind = 47

--�����ı�����
x200024_g_MissionName="Ѫս����ׯ"
x200024_g_MissionInfo="#{Mis_juqing_0023}"
x200024_g_MissionTarget="#{Mis_juqing_Tar_0023}"	--����Ŀ��
x200024_g_MissionComplete="  $N������������ӣ��Ϸ�һ�����κ����СѾͷ�ġ������˺�֮��һ��Ҫ˵���Ǻ����˵�������"	--�������npc˵���Ļ�

x200024_g_MoneyBonus=63000
x200024_g_exp=64000

x200024_g_RadioItemBonus={{id=10415004 ,num=1},{id=10415005,num=1},{id=10415006,num=1},{id=10415007,num=1}}

x200024_g_Custom	= { {id="�ѱ����Ƿ�����",num=1} }
x200024_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200024_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200024_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200024_g_MissionName)
			--AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
		EndEvent( )
		bDone = x200024_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId,bDone)
    --���������������
  elseif x200024_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200024_g_MissionName)
			AddText(sceneId,x200024_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200024_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
			for i, item in x200024_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200024_OnEnumerate( sceneId, selfId, targetId )
  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200024_g_MissionId) > 0 then
		return
	end

  --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200024_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == "ѦĽ��"   then
			AddNumText(sceneId,x200024_g_ScriptId,x200024_g_MissionName,2,-1);
		end
	--���������������
	elseif x200024_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200024_g_ScriptId,x200024_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200024_CheckAccept( sceneId, selfId )
	
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) < 40 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200024_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200024_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200024_g_MissionId, x200024_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y��������Ѫս����ׯ",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200024_g_SignPost.x, x200024_g_SignPost.z, x200024_g_SignPost.tip )
	
	-- ��������󣬿�������
	LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 12, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 13, 1)
	
end

--**********************************
--��ʱ�¼�
--**********************************
function x200024_OnTimer(sceneId,selfId)--,missionIndex)
	
end

--**********************************
--����
--**********************************
function x200024_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200024_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200024_g_SignPost.tip )
end


--**********************************
--����
--**********************************
function x200024_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x200024_g_MissionName)
	AddText(sceneId,x200024_g_MissionComplete)
	AddText(sceneId,"#{M_SHOUHUO}#r")
	AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
	for i, item in x200024_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200024_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200024_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
	
	local Kill1 = LuaFnGetCopySceneData_Param(sceneId, 15)

	if Kill1~=1 			then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200024_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200024_CheckSubmit(sceneId, selfId) == 1   then
  	BeginAddItem(sceneId)
		for i, item in x200024_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		local ret = EndAddItem(sceneId,selfId)
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

		AddMoney(sceneId,selfId,x200024_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200024_g_exp)

		DelMission( sceneId, selfId, x200024_g_MissionId )
		MissionCom( sceneId, selfId, x200024_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�������Ѫս����ׯ",MSG2PLAYER_PARA )

		Msg2Player( sceneId, selfId,"���Ѿ������#G����ׯ#Wϵ������",MSG2PLAYER_PARA )
		local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
		LuaFnSendMailToGUID(sceneId, selfGuid, "���Ѿ������#G����ׯ#Wϵ���������ڴﵽ50��֮���ڴ�����ҵ�����ʦ������#G��ãɽ#Wϵ������")

		-- ��ɾ���ׯ���飬��10������
		local nPoint = GetHumanJuqingPoint(sceneId, selfId)
		SetHumanJuqingPoint(sceneId, selfId, nPoint+10)

		-- ֪ͨ��ң�����������ѭ��������
		-- �����ڿ���ȥAA�ǵ�[bb��cc]�ҵ�DD������DDѭ������
		local strText1 = "#{LOOTMISSION_MAIL_08}"
		LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
		
		BeginEvent(sceneId)
			AddText(sceneId,"#{LOOTMISSION_INFO_03}");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200024_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex
	if GetName(sceneId,objId) == "����"	  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,3,1)
	end
	if GetName(sceneId,objId) == "����"	  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,4,1)
	end
	
end

--**********************************
--���������¼�
--**********************************
function x200024_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200024_OnItemChanged( sceneId, selfId, itemdataId )
end


