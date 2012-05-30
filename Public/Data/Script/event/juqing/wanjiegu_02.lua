--��������
--��ٹȣ�����
-- �������ٹ�    �Ӹ�����ͷ�Ķ������������񣬵�������ͷ�Ͷ��������

--************************************************************************
--MisDescBegin
--�ű���
x200002_g_ScriptId = 200002

--�����
x200002_g_MissionId = 5

--ǰ�������
x200002_g_PreMissionId = 4

--Ŀ��NPC
x200002_g_Name = "������"

--��������NPC����
x200002_g_Position_X=74
x200002_g_Position_Z=50
x200002_g_SceneID=2
x200002_g_AccomplishNPC_Name="������"

--�Ƿ��Ǿ�Ӣ����
x200002_g_IfMissionElite = 1

--����ȼ�
x200002_g_MissionLevel = 20

--�������
x200002_g_MissionKind = 51

--�����ı�����
x200002_g_MissionName="�������ٹ�"
x200002_g_MissionInfo="#{Mis_juqing_0005}"
x200002_g_MissionTarget="#{Mis_juqing_Tar_0005}"	--����Ŀ��
x200002_g_MissionComplete="  $N�����������ˣ����ǵ���ܾ��ˡ�"	--�������npc˵���Ļ�

x200002_g_MoneyBonus=10
x200002_g_exp=1500

x200002_g_Custom	= { {id="���ҵ�������",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200002_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200002_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200002_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --���������Ǹ���
			-- ��������֣���ȫ���
			if GetName(sceneId, targetId) == x200002_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200002_g_MissionName)
				AddText(sceneId,x200002_g_MissionComplete)
				AddMoneyBonus( sceneId, x200002_g_MoneyBonus )
		    EndEvent( )
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200002_g_ScriptId,x200002_g_MissionId)
			end
		end
	
	--���������������
	elseif x200002_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200002_g_MissionName)
			AddText(sceneId,x200002_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200002_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200002_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200002_g_ScriptId,x200002_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200002_OnEnumerate( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200002_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200002_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		local sceneType = LuaFnGetSceneType(sceneId) ;
		if sceneType == 1 then --���������Ǹ���
			AddNumText(sceneId, x200002_g_ScriptId,x200002_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200002_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200002_g_ScriptId,x200002_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200002_CheckAccept( sceneId, selfId )
	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200002_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200002_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ20
	if GetLevel(sceneId, selfId) < 20   then
		return 0
	end

	--3���������Ǹ���
	local sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --���������Ǹ���
		return 0
	end
	
	return 1
end


--**********************************
--����
--**********************************
function x200002_OnAccept( sceneId, selfId, targetId )

	if x200002_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200002_g_MissionId, x200002_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y���������������ٹ�",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200002_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--����
--**********************************
function x200002_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200002_g_MissionId )
end

--**********************************
--����
--**********************************
function x200002_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200002_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200002_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- �����ύ�������ж�
	-- 1�����������
	if( IsHaveMission(sceneId,selfId,x200002_g_MissionId) > 0)  then
		AddMoney(sceneId,selfId,x200002_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200002_g_exp)

		DelMission( sceneId, selfId,  x200002_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId, selfId, x200002_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y��������������ٹ�",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200006), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200002_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200002_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200002_OnItemChanged( sceneId, selfId, itemdataId )
	
end

