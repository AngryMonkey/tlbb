-- 200052 ����չ���ҹ��
-- ������ˮȥ������Ϣ֪ͨ�����ǵĺ���������

--************************************************************************
--MisDescBegin
--�ű���
x200052_g_ScriptId = 200052

--�����
x200052_g_MissionId = 42

--ǰ�������
x200052_g_PreMissionId = 41

--����Ŀ��NPC����
x200052_g_Position_X=113
x200052_g_Position_Z=64
x200052_g_SceneID=0
x200052_g_AccomplishNPC_Name="��������"

--Ŀ��NPC
x200052_g_Name = "��������"

--�Ƿ��Ǿ�Ӣ����
x200052_g_IfMissionElite = 1

--����ȼ�
x200052_g_MissionLevel = 70

--�������
x200052_g_MissionKind = 49

--�����ı�����
x200052_g_MissionName="����չ���ҹ��"
x200052_g_MissionInfo="#{Mis_juqing_0042}"
x200052_g_MissionTarget="#{Mis_juqing_Tar_0042}"	--����Ŀ��
x200052_g_MissionComplete="  ������̫����Ȼް�ڵ�·�������ϱض���ʹ��������"


x200052_g_MoneyBonus=10800
x200052_g_exp=21600

x200052_g_Custom	= { {id="���ҵ���������",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200052_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200052_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200052_g_MissionId) > 0)  then
		-- ����ǲ����ڸ������ټ���ǲ��ǣ�����ǾͿ���ֱ�������^_^
			-- ��������֣���ȫ���
		if GetName(sceneId, targetId) == x200052_g_Name  then
		    BeginEvent(sceneId)
					AddText(sceneId,x200052_g_MissionName)
					AddText(sceneId,x200052_g_MissionComplete)
					AddMoneyBonus( sceneId, x200052_g_MoneyBonus )
		    EndEvent( )
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x200052_g_ScriptId,x200052_g_MissionId)
		end
	
	--���������������
	elseif x200052_CheckAccept(sceneId, selfId, targetId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200052_g_MissionName)
			AddText(sceneId,x200052_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200052_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200052_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200052_g_ScriptId,x200052_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x200052_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200052_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200052_g_MissionId) > 0 then
		--��Ҫ�ڸ����ſ���
		if GetName(sceneId, targetId) == x200052_g_Name    then
			AddNumText(sceneId, x200052_g_ScriptId,x200052_g_MissionName,2,-1);
		end
		
	--���������������
	elseif x200052_CheckAccept(sceneId,selfId,targetId) > 0 then	
		if GetName(sceneId, targetId) == "����"    then
			AddNumText(sceneId,x200052_g_ScriptId,x200052_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200052_CheckAccept( sceneId, selfId, targetId )
	--�ж�����
	--1��ǰ���������
	if IsMissionHaveDone(sceneId,selfId,x200052_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200052_g_MissionId) > 0  then
		return 0
	end
	
	--2���ȼ��ﵽ50
	if GetLevel(sceneId, selfId) < 70   then
		return 0
	end

	return 1
end


--**********************************
--����
--**********************************
function x200052_OnAccept( sceneId, selfId, targetId )

	if x200052_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200052_g_MissionId, x200052_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y�������񣺻���չ���ҹ��",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200052_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--��ʱ�¼�
--**********************************
function x200052_OnTimer(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x200052_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200052_g_MissionId )
end

--**********************************
--����
--**********************************
function x200052_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200052_CheckSubmit( sceneId, selfId, selectRadioId )

end

--**********************************
--�ύ
--**********************************
function x200052_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- �����ύ�������ж�
		--���������
		AddMoney(sceneId,selfId, x200052_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200052_g_exp)

		DelMission( sceneId, selfId, x200052_g_MissionId )
		MissionCom( sceneId, selfId, x200052_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y������񣺻���չ���ҹ��", MSG2PLAYER_PARA )
	--�������ͽ�Ǯ

		-- ���ú�������
		CallScriptFunction((200053), "OnDefaultEvent",sceneId, selfId, targetId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200052_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200052_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200052_OnItemChanged( sceneId, selfId, itemdataId )
	
end


