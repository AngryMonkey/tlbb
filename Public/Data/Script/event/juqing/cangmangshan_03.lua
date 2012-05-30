-- 	����   ���ɹ��ʵ۵�ʥּ�����㱱��Ү����á�

--************************************************************************
--MisDescBegin
--�ű���
x200032_g_ScriptId = 200032

--�����
x200032_g_MissionId = 28

--ǰ�������
x200032_g_PreMissionId = 27

--��������NPC����
x200032_g_Position_X=195
x200032_g_Position_Z=41
x200032_g_SceneID=19
x200032_g_AccomplishNPC_Name="Ү������"

--Ŀ��NPC
x200032_g_Name = "Ү�����"

--�Ƿ��Ǿ�Ӣ����
x200032_g_IfMissionElite = 1

--����ȼ�
x200032_g_MissionLevel = 50

--�������
x200032_g_MissionKind = 52

--�����ı�����
x200032_g_MissionName="����"
x200032_g_MissionInfo="#{Mis_juqing_0028}"
x200032_g_MissionTarget="#{Mis_juqing_Tar_0028}"	--����Ŀ��
x200032_g_MissionComplete="  ĩ����ּ��һ�������ʵ����С�"	--�������npc˵���Ļ�

x200032_g_MoneyBonus=21600
x200032_g_exp=26400

x200032_g_Custom	= { {id="�ѵõ��ɹ��ʵ۵�ʥּ",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200032_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200032_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200032_g_MissionId) > 0)  then
		-- ��������֣���ȫ���
		if GetName(sceneId, targetId) == x200032_g_Name  then
	    BeginEvent(sceneId)
			AddText(sceneId,x200032_g_MissionName)
			AddText(sceneId,x200032_g_MissionComplete)
			AddMoneyBonus( sceneId, x200032_g_MoneyBonus )
	    EndEvent( )
	    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200032_g_ScriptId,x200032_g_MissionId)
		end
	
	--���������������
	elseif x200032_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x200032_g_MissionName)
		AddText(sceneId,x200032_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200032_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200032_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200032_g_ScriptId,x200032_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200032_OnEnumerate( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200032_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200032_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		if GetName(sceneId, targetId) == x200032_g_Name  then
			AddNumText(sceneId, x200032_g_ScriptId,x200032_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200032_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200032_g_ScriptId,x200032_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200032_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200032_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200032_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200032_g_PreMissionId) < 1  then
		return 0
	end
	
	--3���������Ǹ���
	local sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType ~= 1 then --���������Ǹ���
		return 0
	end
	
	return 1
end


--**********************************
--����
--**********************************
function x200032_OnAccept( sceneId, selfId, targetId )

	if x200032_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- ��Ҫ��������϶�һ����Ʒ
	BeginAddItem( sceneId )
		AddItem( sceneId, 40001008, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--��ʾ���ܽ�������
		Msg2Player(  sceneId, selfId,"#Y������񱳰��Ѿ����ˡ�", MSG2PLAYER_PARA )
	else
		--������������б�
		local ret = AddMission( sceneId,selfId, x200032_g_MissionId, x200032_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
			return
		end
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y������������",MSG2PLAYER_PARA )
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200032_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	end

end

--**********************************
--����
--**********************************
function x200032_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200032_g_MissionId )
	DelItem( sceneId, selfId, 40001008, 1 )	
 
end

--**********************************
--����
--**********************************
function x200032_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200032_CheckSubmit( sceneId, selfId, selectRadioId )

end

--**********************************
--�ύ
--**********************************
function x200032_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- �����ύ�������ж�
	-- 1�����������
	if( IsHaveMission(sceneId,selfId,x200032_g_MissionId) > 0)  then
		--���������
		DelItem( sceneId, selfId, 40001008, 1 )	
		AddMoney(sceneId,selfId, x200032_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200032_g_exp)

		DelMission( sceneId, selfId,  x200032_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId, selfId,  x200032_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�����������",MSG2PLAYER_PARA )

		-- ���ú�������
		CallScriptFunction((200033), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x200032_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200032_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200032_OnItemChanged( sceneId, selfId, itemdataId )
	
end


