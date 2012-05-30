-- ҹ���ζ�
-- �Ѹ�����ͷ�����̵����͸����ݳǵ�Ľ�ݸ�

--MisDescBegin
--�ű���
x200013_g_ScriptId = 200013

--�����
x200013_g_MissionId = 12

--ǰ�������
x200013_g_PreMissionId = 11

--��һ�������ID
--g_MissionIdPre = 
--��������NPC����
x200013_g_Position_X=129
x200013_g_Position_Z=77
x200013_g_SceneID=1
x200013_g_AccomplishNPC_Name="Ľ�ݸ�"

--Ŀ��NPC
x200013_g_Name	="Ľ�ݸ�"

--�������
x200013_g_MissionKind = 48

--����ȼ�
x200013_g_MissionLevel = 30

--�Ƿ��Ǿ�Ӣ����
x200013_g_IfMissionElite = 0

--������
x200013_g_MissionName="ҹ���ζ�"
x200013_g_MissionInfo="#{Mis_juqing_0012}"
x200013_g_MissionTarget="#{Mis_juqing_Tar_0012}"
x200013_g_MissionContinue="  ��������ʲô������"
x200013_g_MissionComplete="  �Ǳ���������Ҵ����������������ǲ����Ѿ�ƽ�������ˣ����ȿ����š�"

x200013_g_MoneyBonus=8100
x200013_g_exp=8000

x200013_g_DemandItem={{id=40001004,num=1}}

--x200013_g_Custom	= { {id="���ҵ�Ľ�ݸ�",num=1} }
x200013_g_IsMissionOkFail = 0
--MisDescEnd

--x200013_g_MissionItem = 40001004


--**********************************
--������ں���
--**********************************
function x200013_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200013_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200013_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200013_g_Name then
			x200013_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200013_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200013_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
			AddText(sceneId,x200013_g_MissionName)
			AddText(sceneId,x200013_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200013_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200013_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200013_g_ScriptId,x200013_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200013_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200013_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200013_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200013_g_Name then
			AddNumText(sceneId, x200013_g_ScriptId,x200013_g_MissionName,2,-1);
		end
	--���������������
	elseif x200013_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200013_g_Name then
			AddNumText(sceneId,x200013_g_ScriptId,x200013_g_MissionName,1,-1);
		end
	end
end

--**********************************
--����������
--**********************************
function x200013_CheckAccept( sceneId, selfId )
	--��Ҫ3�����ܽ�
	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end
	
	if 	IsMissionHaveDone(sceneId,selfId,x200013_g_PreMissionId) < 1 then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x200013_OnAccept( sceneId, selfId )
	
	-- ���������ߣ�"40001004",�����̵���
	BeginAddItem( sceneId )
		AddItem( sceneId, 40001004, 1 )
	local ret = EndAddItem( sceneId, selfId )
	
	if ret <= 0 then 
		--��ʾ���ܽ�������
		Msg2Player(  sceneId, selfId,"#Y������񱳰��Ѿ����ˡ�", MSG2PLAYER_PARA )
	else
		--������������б�
		local ret = AddMission( sceneId,selfId, x200013_g_MissionId, x200013_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
			return
		end
	
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y��������ҹ���ζ�",MSG2PLAYER_PARA )
		--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200013_g_SignPost.x, x200013_g_SignPost.z, x200013_g_SignPost.tip )
		
		-- ����������ɱ��
		
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200013_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		--SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		
	end
end

--**********************************
--����
--**********************************
function x200013_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x200013_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200013_g_SignPost.tip )
	-- ɾ�������Ʒ
	DelItem( sceneId, selfId, 40001004, 1 )	
	
end

--**********************************
--����
--**********************************
function x200013_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200013_g_MissionName)
		AddText(sceneId,x200013_g_MissionComplete)
		AddMoneyBonus( sceneId, x200013_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200013_g_ScriptId,x200013_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200013_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200013_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200013_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200013_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--ɾ��������Ʒ 
		DelItem( sceneId, selfId, 40001004, 1 )

		--���������
		AddMoney(sceneId,selfId, x200013_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200013_g_exp)

		DelMission( sceneId, selfId, x200013_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId, selfId, x200013_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y�������ҹ���ζ�", MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200085), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x200013_OnKillObject( sceneId, selfId, objdataId )
	
end

--**********************************
--���������¼�
--**********************************
function x200013_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200013_OnItemChanged( sceneId, selfId, itemdataId )
	
end

