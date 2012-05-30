-- 200090 
-- �������� 

--MisDescBegin

--�ű���
x200090_g_ScriptId = 200090

--�����
x200090_g_MissionId = 20

--ǰ������
x200090_g_PreMissionId = 19

--��������NPC����
x200090_g_Position_X=210.2844
x200090_g_Position_Z=201.6758
x200090_g_SceneID=0
x200090_g_AccomplishNPC_Name="�쾪��"

--Ŀ��NPC
x200090_g_Name	="�쾪��"

--�������
x200090_g_MissionKind = 47

--����ȼ�
x200090_g_MissionLevel = 40

--�Ƿ��Ǿ�Ӣ����
x200090_g_IfMissionElite = 0

--������
x200090_g_MissionName="����ׯ"
x200090_g_MissionInfo="#{Mis_juqing_0020}"
x200090_g_MissionTarget="#{Mis_juqing_Tar_0020}"
x200090_g_MissionComplete="  ��Ȼ���Ѵ�ʦ�����Ŵ�ʦ��λ��ɮҪ������ׯ��������Ӣ�۾Ͳ���Ⱥ�������ˡ�$N����л���ˡ������������£����Ժ;���ׯ�ڵ�Ӣ���ǽύһ�¡�"

x200090_g_MoneyBonus=5400
x200090_g_exp=5400

x200090_g_Custom	= { {id="���ҵ��쾪��",num=1} }
x200090_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200090_OnDefaultEvent( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200090_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200090_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200090_g_Name then
			x200090_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200090_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200090_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200090_g_MissionName)
				AddText(sceneId,x200090_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200090_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200090_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200090_g_ScriptId,x200090_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200090_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200090_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200090_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200090_g_Name then
			AddNumText(sceneId, x200090_g_ScriptId,x200090_g_MissionName,2,-1);
		end
	--���������������
	elseif x200090_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200090_g_Name then
			AddNumText(sceneId,x200090_g_ScriptId,x200090_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200090_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200090_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200090_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200090_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--����
--**********************************
function x200090_OnAccept( sceneId, selfId, targetId )
	if x200090_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200090_g_MissionId, x200090_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y�������񣺾���ׯ",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200090_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x200090_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200090_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200090_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200090_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200090_g_MissionName)
		AddText(sceneId,x200090_g_MissionComplete)
		AddMoneyBonus( sceneId, x200090_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200090_g_ScriptId,x200090_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200090_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200090_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200090_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200090_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId,x200090_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200090_g_exp)
		DelMission( sceneId,selfId,  x200090_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200090_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺾���ׯ",MSG2PLAYER_PARA )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200090_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200090_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200090_OnItemChanged( sceneId, selfId, itemdataId )
end
