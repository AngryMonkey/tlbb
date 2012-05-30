-- 212141 
-- �����̶�


--MisDescBegin
--�ű���
x212141_g_ScriptId = 212141

--��������NPC����
x212141_g_Position_X=262
x212141_g_Position_Z=46
x212141_g_SceneID=18
x212141_g_AccomplishNPC_Name="������"

--�����
x212141_g_MissionId = 964

--ǰ������
x212141_g_PreMissionId = 963

--�������
x212141_g_MissionKind = 20

--����ȼ�
x212141_g_MissionLevel = 30

--�Ƿ��Ǿ�Ӣ����
x212141_g_IfMissionElite = 0

--������
x212141_g_MissionName="�����̶�"
x212141_g_MissionInfo="#{Mis_shaolin_964}"
x212141_g_MissionTarget="#G���Ź�#W��#R������#W#{_INFOAIM263,46,18,������}Ҫ�������Źذ�ΧȦ��ɱ����ʮ���ؼ�կ�ܱ���"
x212141_g_MissionContinue="  ���Ѿ��ɵ����е��ؼ�կ�ܱ�����"
x212141_g_MissionComplete="  �治������ʦָ��������$N��Ȼ�����鴫��"

x212141_g_MoneyBonus=1000
x212141_g_exp=2000

x212141_g_Custom	= { {id="��ɱ���ؼ�կ�ܱ�",num=20} }
x212141_g_IsMissionOkFail = 0

x212141_g_Menpai = 0

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x212141_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212141_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212141_g_MissionId) > 0)  then
		-- ��������ǲ��������
		BeginEvent(sceneId)
			AddText(sceneId,x212141_g_MissionName);
			AddText(sceneId,x212141_g_MissionContinue);
		EndEvent(sceneId)
  	local done = x212141_CheckSubmit( sceneId, selfId );
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212141_g_ScriptId,x212141_g_MissionId,done)

	--���������������
	elseif x212141_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212141_g_MissionName)
			AddText(sceneId,x212141_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212141_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212141_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212141_g_ScriptId,x212141_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212141_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212141_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212141_g_MissionId) > 0 then
		AddNumText(sceneId, x212141_g_ScriptId,x212141_g_MissionName,2,-1);
	--���������������
	elseif x212141_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212141_g_ScriptId,x212141_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212141_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212141_g_MissionId) > 0 ) then
		return 0
	end
	
	-- ǰ�������ǲ������
	if (IsMissionHaveDone(sceneId,selfId,x212141_g_PreMissionId) < 1 ) then
		return 0
	end
	
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212141_g_MissionLevel then
		return 0
	end
	
	-- ���ɼ��
	if GetMenPai(sceneId, selfId) ~= x212141_g_Menpai  then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212141_OnAccept( sceneId, selfId, targetId )
	
	if x212141_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	--������������б�
	local ret = AddMission(sceneId,selfId, x212141_g_MissionId, x212141_g_ScriptId, 1, 0, 0)
	if ret <= 0 then
		local strText = "#Y���������־�Ѿ����ˡ�"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = "#Y�������������̶���"
	Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212141_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	--�������ɱ��
	
end

--**********************************
--����
--**********************************
function x212141_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212141_g_MissionId )
end

--**********************************
--����
--**********************************
function x212141_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
		AddText(sceneId,x212141_g_MissionName)
		AddText(sceneId,x212141_g_MissionComplete)
		AddMoneyBonus( sceneId, x212141_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212141_g_ScriptId,x212141_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212141_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212141_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212141_g_MissionId)
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) == 0   then
		return 0
	end
	
	return 1
end

--**********************************
--�ύ
--**********************************
function x212141_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212141_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212141_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212141_g_exp)
		DelMission( sceneId, selfId, x212141_g_MissionId )
		MissionCom( sceneId, selfId, x212141_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y������������̶�",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212141_OnKillObject( sceneId, selfId, objdataId, objId )	
	
	local missionId = x212141_g_MissionId
	
	-- ��Ҫ�������ж���
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName == "�ؼ�կ�ܱ�"   then
		
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, missionId) > 0 then
				-- ���ж��ǲ����Ѿ���������ɱ�־
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,missionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					
					local killCount = GetMissionParam(sceneId, humanObjId, misIndex, 1)
					killCount = killCount + 1
		     	BeginEvent(sceneId)
						local strText = format("��ɱ���ؼ�կ�ܱ���" .. killCount .. "/20" )
						AddText(sceneId, strText)
				  EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
					
					if killCount >= 20 then
						SetMissionByIndex( sceneId, humanObjId, misIndex, 0, 1)
					end
					SetMissionByIndex( sceneId, humanObjId, misIndex, 1, killCount)
					
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x212141_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212141_OnItemChanged( sceneId, selfId, itemdataId )
end

