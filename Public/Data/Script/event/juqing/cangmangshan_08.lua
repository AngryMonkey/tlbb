-- 200037

-- 200037 ��굴�����
-- ��ãɽ����Ҫ����

-- ���ڸ��������ɱ������

--************************************************************************
--MisDescBegin
--�ű���
x200037_g_ScriptId = 200037

--�����
x200037_g_MissionId = 31

--Ŀ��NPC
x200037_g_Name = "����"

--�����ı�����
x200037_g_MissionName="��굴�����"
x200037_g_MissionInfo="#{Mis_juqing_0031}"
x200037_g_MissionTarget="#{Mis_juqing_Tar_0031}"	--����Ŀ��
x200037_g_MissionComplete="    $N����һ���Ѿ������Ѿ���ɢ�ˣ���Ҫ�ż������ǲ���ΪӪ�������ҳ���ƽϢ��"	--�������npc˵���Ļ�
x200037_g_MissionContinue="  �����Ѿ���ɱ����̫��Ҳ�Ѿ������������ˡ�"

x200037_g_MoneyBonus=36000
x200037_g_exp=34000

x200037_g_RadioItemBonus={{id=10423012 ,num=1},{id=10423013,num=1},{id=10423014,num=1}}

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200037_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200037_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200037_g_MissionName)
			AddText(sceneId,x200037_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200037_g_MoneyBonus )
		EndEvent( )
		bDone = x200037_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200037_g_ScriptId,x200037_g_MissionId,bDone)
    --���������������
  end

end

--**********************************
--�о��¼�
--**********************************
function x200037_OnEnumerate( sceneId, selfId, targetId )
  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200037_g_MissionId) > 0 then
		return
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200037_g_MissionId) > 0 then
		AddNumText(sceneId,x200037_g_ScriptId,x200037_g_MissionName,2,-1);
		--���������������
	end

end

--**********************************
--����������
--**********************************
function x200037_CheckAccept( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200037_OnAccept( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200037_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x200037_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200037_g_MissionName)
		AddText(sceneId,x200037_g_MissionComplete)
		AddMoneyBonus( sceneId, x200037_g_MoneyBonus )
		for i, item in x200037_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200037_g_ScriptId,x200037_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200037_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200037_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	if LuaFnGetCopySceneData_Param(sceneId, 8) > 7  then
		return 1
	end
	
	return 0

end

--**********************************
--�ύ
--**********************************
function x200037_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x200037_CheckSubmit(sceneId, selfId) == 1  then
		--���������
  	BeginAddItem(sceneId)
		for i, item in x200037_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId, x200037_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200037_g_exp)

		DelMission( sceneId, selfId, x200037_g_MissionId )
		MissionCom( sceneId, selfId, x200037_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺽�굴�����",MSG2PLAYER_PARA )
	end

end

--**********************************
--ɱ����������
--**********************************
function x200037_OnKillObject( sceneId, selfId, objdataId ,objId)
	
end

--**********************************
--���������¼�
--**********************************
function x200037_OnEnterArea( sceneId, selfId, zoneId )

end

--**********************************
--���߸ı�
--**********************************
function x200037_OnItemChanged( sceneId, selfId, itemdataId )
end


