-- �����

--MisDescBegin
--�ű���
x200007_g_ScriptId = 200007

--�����
x200007_g_MissionId = 7

--ǰ������
x200007_g_PreMissionId = 6

--Ŀ��NPC
x200007_g_Name	="������"
x200007_g_Name1 ="������"

--�������
x200007_g_MissionKind = 51

--����ȼ�
x200007_g_MissionLevel = 20

--�Ƿ��Ǿ�Ӣ����
x200007_g_IfMissionElite = 0

--������
x200007_g_MissionName="�����"
--��������
x200007_g_MissionInfo="#{Mis_juqing_0007}"
--����Ŀ��
x200007_g_MissionTarget="#{Mis_juqing_Tar_0007}"		

x200007_g_MissionContinue="  ��������ʲô������"
--�ύʱnpc�Ļ�
x200007_g_MissionComplete="  �����������ˡ�"

x200007_g_MoneyBonus=1580
x200007_g_exp=12000

x200007_g_Custom	= { {id="�ѻ��Ͷ�����",num=1} }

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x200007_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	--����������ִ�д˽ű�
	
	if IsHaveMission(sceneId,selfId,x200007_g_MissionId) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId, x200007_g_MissionName)
			AddText(sceneId, x200007_g_MissionContinue)
			--AddText(sceneId,"#{M_SHOUHUO}#r")
			--AddMoneyBonus( sceneId, x200007_g_MoneyBonus )
		EndEvent( )
		local bDone = x200007_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200007_g_ScriptId,x200007_g_MissionId,bDone)
	elseif x200007_CheckAccept(sceneId,selfId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId, x200007_g_MissionName)
			AddText(sceneId, x200007_g_MissionInfo)
			AddText(sceneId, "#{M_MUBIAO}#r")
			AddText(sceneId, x200007_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200007_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200007_g_ScriptId,x200007_g_MissionId)
	end	
end

--**********************************
--�о��¼�
--**********************************
function x200007_OnEnumerate( sceneId, selfId, targetId )
	if 0 > GetLevel(sceneId, selfId)  then
		return
	end
	
	-- ���ǰ������1û����ɣ��ͷ���
	if IsMissionHaveDone(sceneId, selfId, 6) <= 0   then
		return
	end
	-- ����������Ѿ���ɣ��ͷ���
	if IsMissionHaveDone(sceneId, selfId, x200007_g_MissionId) > 0 then
   	return
	--���������������
	elseif IsHaveMission(sceneId, selfId, x200007_g_MissionId) > 0 then

		if GetName(sceneId, targetId) == x200007_g_Name1  then
			--local misIndex = GetMissionIndexByID(sceneId, selfId, x200007_g_MissionId) 
			--if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 	then   --����������
			if LuaFnGetCopySceneData_Param(sceneId, 11) >= 4   then
				AddNumText(sceneId, x200007_g_ScriptId, x200007_g_MissionName,2,0);
			end
		end

	--���������������
  elseif x200007_CheckAccept(sceneId, selfId) > 0 then
		if GetName(sceneId, targetId) == x200007_g_Name then
			AddNumText(sceneId, x200007_g_ScriptId, x200007_g_MissionName,1,-1);
		end
  end
end

--**********************************
-- 
--**********************************
function x200007_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

end

--**********************************
--����������
--**********************************
function x200007_CheckAccept( sceneId, selfId )
	-- ������������ǣ�����ﵽ20�����ϣ����������ǰ������
	if GetLevel(sceneId, selfId) < 20   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200007_g_PreMissionId ) < 1   then
		return 0
	end
	
	-- ��������Ѿ���ʼ���Ͳ����ٽ��������
	if LuaFnGetCopySceneData_Param(sceneId, 25) == 1   then
		return 0
	end

	return 1

end

--**********************************
--����
--**********************************
function x200007_OnAccept( sceneId, selfId, targetId )

	if x200007_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x200007_g_MissionId) > 0   then
		return
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x200007_g_MissionId, x200007_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#Y�������񣺴����",MSG2PLAYER_PARA )

	-- ֪ͨ����������ʱ�����������;���
	if LuaFnGetCopySceneData_Param(sceneId, 11) == 0 then
		LuaFnSetCopySceneData_Param(sceneId, 11, 1)
		LuaFnSetCopySceneData_Param(sceneId, 12, targetId)
	end
	
	-- ��ʼ���ͺ�ɾ��  ��ٹ����� 
	local nMonsterNum1 = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum1-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == "��ٹ�����"  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end

	LuaFnSetCopySceneData_Param(sceneId, 25, 1)

end

--**********************************
--����
--**********************************
function x200007_OnAbandon( sceneId, selfId )
  --������npc˲�ƻ�ԭ��λ��
  DelMission(sceneId, selfId, x200007_g_MissionId)
  
end

--**********************************
--����
--**********************************
function x200007_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200007_g_MissionName)
		AddText(sceneId,x200007_g_MissionComplete)
	EndEvent( )
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200007_g_ScriptId, x200007_g_MissionId)

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200007_CheckSubmit( sceneId, selfId )
	
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x200007_g_MissionId) 
	--local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)
	
	--1, �Ƿ����������
	if IsHaveMission(sceneId,selfId,x200007_g_MissionId) < 1 then
		return 0;
	end
	
	--2, �Ƿ��Ѿ�����������
	if IsMissionHaveDone(sceneId,selfId,x200007_g_MissionId) > 0  then
		return 0;
	end

	--3, �����ض��ж�	
	local bComplete = LuaFnGetCopySceneData_Param(sceneId, 11)
	if bComplete >=4  then
		return 1
	else
		return 0
	end
	
end

--**********************************
--�ύ
--**********************************
function x200007_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )

	-- ����ǲ�������������������
	if x200007_CheckSubmit(sceneId, selfId ) ~= 1   then
		return
	end

	if DelMission( sceneId,selfId, x200007_g_MissionId ) ~= 1 then
		return
	end

	--���������Ѿ�����ɹ�
	MissionCom( sceneId,selfId, x200007_g_MissionId )
	AddMoney(sceneId,selfId,x200007_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200007_g_exp)
	
	Msg2Player(  sceneId, selfId,"#Y������񣺴����",MSG2PLAYER_PARA )

	-- ���ú�������
	CallScriptFunction((200008), "OnDefaultEvent",sceneId, selfId, targetId )

end

function x200007_OnHumanDie(sceneId, selfId)

end

--**********************************
--��ʱ�¼�
--**********************************
function x200007_OnTimer(sceneId,selfId)--,missionIndex)

end
