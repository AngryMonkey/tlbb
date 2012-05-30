-- �˳���  �ز�ãɽ��Ү�ɺ������Ү����õ���ս�ƻ���������


--************************************************************************
--MisDescBegin
--�ű���
x200033_g_ScriptId = 200033

--�����
x200033_g_MissionId = 29

--ǰ�������
x200033_g_PreMissionId = 28

--Ŀ��NPC
x200033_g_Name = "Ү�ɺ��"

--�Ƿ��Ǿ�Ӣ����
x200033_g_IfMissionElite = 1

--����ȼ�
x200033_g_MissionLevel = 50

--�������
x200033_g_MissionKind = 52

--�����ı�����
x200033_g_MissionName="�˳���"
x200033_g_MissionInfo="#{Mis_juqing_0029}"
x200033_g_MissionTarget="#{Mis_juqing_Tar_0029}"	--����Ŀ��
x200033_g_MissionComplete="  #{TM_20080313_01}"	--�������npc˵���Ļ�

x200033_g_MoneyBonus=18000
x200033_g_exp=24000

x200033_g_Custom	= { {id="���ҵ�Ү�ɺ��",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200033_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200033_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200033_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --���������Ǹ���
			-- ��������֣���ȫ���
			if GetName(sceneId, targetId) == x200033_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200033_g_MissionName)
				AddText(sceneId,x200033_g_MissionComplete)
				AddMoneyBonus( sceneId, x200033_g_MoneyBonus )
		    EndEvent( )
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200033_g_ScriptId,x200033_g_MissionId)
			end
		end
	
	--���������������
	elseif x200033_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x200033_g_MissionName)
		AddText(sceneId,x200033_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200033_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200033_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200033_g_ScriptId,x200033_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200033_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200033_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200033_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		local sceneType = LuaFnGetSceneType(sceneId) ;
		if sceneType == 1 then --���������Ǹ���
			AddNumText(sceneId, x200033_g_ScriptId,x200033_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200033_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200033_g_ScriptId,x200033_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200033_CheckAccept( sceneId, selfId )
	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200033_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200033_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ20
	if GetLevel(sceneId, selfId) < x200033_g_MissionLevel   then
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
function x200033_OnAccept( sceneId, selfId, targetId )

	if x200033_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200033_g_MissionId, x200033_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#{TM_20080313_02}" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#{TM_20080313_03}",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200033_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--����
--**********************************
function x200033_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200033_g_MissionId )
end

--**********************************
--����
--**********************************
function x200033_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200033_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200033_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- �����ύ�������ж�
	-- 1�����������
	if( IsHaveMission(sceneId,selfId,x200033_g_MissionId) > 0)  then
		--���������
		AddMoney(sceneId,selfId,x200033_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200033_g_exp)

		DelMission( sceneId,selfId,  x200033_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200033_g_MissionId )
		Msg2Player(  sceneId, selfId,"#{TM_20080313_04}",MSG2PLAYER_PARA )

		-- ���ú�������
		CallScriptFunction((200035), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x200033_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200033_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200033_OnItemChanged( sceneId, selfId, itemdataId )
	
end

