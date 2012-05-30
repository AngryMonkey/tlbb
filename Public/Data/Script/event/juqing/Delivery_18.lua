-- 200088
-- �������� 

--MisDescBegin

--�ű���
x200088_g_ScriptId = 200088

--�����
x200088_g_MissionId = 18

--ǰ������
x200088_g_PreMissionId = 17

--Ŀ��NPC
x200088_g_Name	="�쾪��"

--�������
x200088_g_MissionKind = 47

--����ȼ�
x200088_g_MissionLevel = 40

--��������NPC����
x200088_g_Position_X=210.2844
x200088_g_Position_Z=201.6758
x200088_g_SceneID=0
x200088_g_AccomplishNPC_Name="�쾪��"

--�Ƿ��Ǿ�Ӣ����
x200088_g_IfMissionElite = 0

--������
x200088_g_MissionName="��ͬ����"
x200088_g_MissionInfo="#{Mis_juqing_0018}"
x200088_g_MissionTarget="#{Mis_juqing_Tar_0018}"
x200088_g_MissionComplete="  �벻��������������������ڲ��ˣ���������ʹ�İ���"

x200088_g_MoneyBonus=5400
x200088_g_exp=5400

x200088_g_Custom	= { {id="���ҵ��쾪��",num=1} }
x200088_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200088_OnDefaultEvent( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200088_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200088_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200088_g_Name then
			x200088_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200088_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200088_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200088_g_MissionName)
				AddText(sceneId,x200088_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200088_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200088_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200088_g_ScriptId,x200088_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200088_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200088_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200088_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200088_g_Name then
			AddNumText(sceneId, x200088_g_ScriptId,x200088_g_MissionName,2,-1);
		end
	--���������������
	elseif x200088_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200088_g_Name then
			AddNumText(sceneId,x200088_g_ScriptId,x200088_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200088_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200088_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200088_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200088_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200088_OnAccept( sceneId, selfId, targetId )
	if x200088_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- ��Ҫ��������϶�һ����Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, 40001006, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--��ʾ���ܽ�������
		Msg2Player(  sceneId, selfId,"#Y������񱳰��Ѿ����ˡ�", MSG2PLAYER_PARA )
	else
		--������������б�
		
		
		local ret = AddMission( sceneId,selfId, x200088_g_MissionId, x200088_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y�������񣺹�ͬ����",MSG2PLAYER_PARA )

		local misIndex = GetMissionIndexByID(sceneId,selfId,x200088_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	end
	
end

--**********************************
--����
--**********************************
function x200088_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200088_g_MissionId )
	DelItem( sceneId, selfId, 40001006, 1 )	

--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200088_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200088_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200088_g_MissionName)
		AddText(sceneId,x200088_g_MissionComplete)
		AddMoneyBonus( sceneId, x200088_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200088_g_ScriptId,x200088_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200088_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200088_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200088_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200088_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- ɾ���������
		DelItem( sceneId, selfId, 40001006, 1 )	
		--���������
		AddMoney(sceneId,selfId,x200088_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200088_g_exp)
		DelMission( sceneId,selfId,  x200088_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200088_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺹�ͬ����",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200089), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200088_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200088_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200088_OnItemChanged( sceneId, selfId, itemdataId )
end
