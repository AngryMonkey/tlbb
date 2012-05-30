--��������
--¬����Ѱ������ʦ
--MisDescBegin
--�ű���
x210204_g_ScriptId = 210204

--��������NPC����
x210204_g_Position_X=160.0895
x210204_g_Position_Z=156.9309
x210204_g_SceneID=2
x210204_g_AccomplishNPC_Name="����ʦ"

--�����
x210204_g_MissionId = 444

--��һ�������ID
x210204_g_MissionIdPre = 443

--Ŀ��NPC
x210204_g_Name	="����ʦ"

--�������
x210204_g_MissionKind = 13

--����ȼ�
x210204_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210204_g_IfMissionElite = 0

--������
x210204_g_MissionName="��һ���Ƽ���"
x210204_g_MissionInfo="#{event_dali_0006}"
x210204_g_MissionTarget="��#G������廪̳#W�ҵ�#G����ʦ#W#{_INFOAIM160,157,2,����ʦ}��#b#G�����������ѡ���»��ߵ����꣬�������ҵ���NPC��#l"
x210204_g_MissionComplete="#{event_dali_0007}" --#r  #Yһ���Ƽ���#Wֻ��ѧϰһ�����ܡ��Ժ���������#G�����#W�������������������ǻ������д#Y�Ƽ���#W�ġ�
x210204_g_MoneyBonus=1
x210204_g_SignPost = {x = 160, z = 156, tip = "����ʦ"}
x210204_g_ItemBonus={{id=40002108,num=1}}

x210204_g_Custom	= { {id="���ҵ�����ʦ",num=1} }
x210204_g_IsMissionOkFail = 1		--�����ĵ�0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210204_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210204_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210204_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210204_g_Name then
			x210204_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210204_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210204_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210204_g_MissionName)
				AddText(sceneId,x210204_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210204_g_MissionTarget)
				for i, item in x210204_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210204_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210204_g_ScriptId,x210204_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210204_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210204_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210204_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210204_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210204_g_Name then
			AddNumText(sceneId, x210204_g_ScriptId,x210204_g_MissionName,2,-1);
		end
    --���������������
    elseif x210204_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210204_g_Name then
			AddNumText(sceneId,x210204_g_ScriptId,x210204_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210204_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210204_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210204_g_MissionId, x210204_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������񣺵�һ���Ƽ���",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210204_g_SignPost.x, x210204_g_SignPost.z, x210204_g_SignPost.tip )

	-- ����������ɱ�־
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210204_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x210204_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210204_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210204_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210204_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210204_g_MissionName)
		AddText(sceneId,x210204_g_MissionComplete)
		AddMoneyBonus( sceneId, x210204_g_MoneyBonus )
		for i, item in x210204_g_ItemBonus do
			AddItemBonus( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210204_g_ScriptId,x210204_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210204_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210204_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210204_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210204_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210204_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210204_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,30)
					ret = DelMission( sceneId, selfId, x210204_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210204_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
				end
				Msg2Player(  sceneId, selfId,"#Y������񣺵�һ���Ƽ���",MSG2PLAYER_PARA )
			else
				--������û�мӳɹ�
				BeginEvent(sceneId)
					strText = "��������,�޷��������"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210204_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210204_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210204_OnItemChanged( sceneId, selfId, itemdataId )
end
