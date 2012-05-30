
-- ���ڸ��������ɱ������

--************************************************************************
--MisDescBegin
--�ű���
x200008_g_ScriptId = 200008

--��������
x200008_g_CopySceneName="��ٹ�"

--�����
x200008_g_MissionId = 8
--�����
x200008_g_PreMissionId = 7

--Ŀ��NPC
x200008_g_Name = "������"

--�Ƿ��Ǿ�Ӣ����
x200008_g_IfMissionElite = 1

--�������
x200008_g_MissionKind = 51

--����ȼ�
x200008_g_MissionLevel = 20

--�����ı�����
x200008_g_MissionName="��Х����"
x200008_g_MissionInfo="#{Mis_juqing_0008}"
x200008_g_MissionTarget="#{Mis_juqing_Tar_0008}"
x200008_g_MissionComplete="  ̫���ˣ���л��İ�æ���Ժ�������������Ϊ���������ߵ�����д��㣡"
x200008_g_MissionContinue="  ���Ѿ��ȳ���������"

x200008_g_MoneyBonus=3720
x200008_g_exp=24000

x200008_g_RadioItemBonus={{id=10423001 ,num=1},{id=10423002,num=1},{id=10423003,num=1},{id=10423004,num=1}}

x200008_g_Custom	= { {id="�Ѿȳ�����",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200008_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 888   then
		-- �����������ǲ�����Կ��
		if  GetItemCount( sceneId, selfId, 40001001 ) > 0   then
			-- ��Ҫ������������ 439
			local nMonsterNum = GetMonsterCount(sceneId)
	
			local ii = 0
			local bHaveMonster = 0
			local bHave=0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
			
				if GetName(sceneId, nMonsterId)  == "����"  then
					bHave = 1
				end
			end
			
			if bHave == 0  then
				local nNpcId = LuaFnCreateMonster(sceneId, 439, 51, 90, 3, 0, 118020)
				SetCharacterName(sceneId, nNpcId, "����")
			end
			
			-- ����������ɱ�־��ɾ��Կ�ף�
			local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			DelItem( sceneId, selfId, 40001001, 1 )
			
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)

		end
		return
	end
	
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200008_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200008_g_MissionName)
			AddText(sceneId,x200008_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
		EndEvent( )
		bDone = x200008_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId,bDone)
    --���������������
  elseif x200008_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200008_g_MissionName)
			AddText(sceneId,x200008_g_MissionInfo)
			AddText(sceneId, "#{M_MUBIAO}#r")
			AddText(sceneId,x200008_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
			for i, item in x200008_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200008_OnEnumerate( sceneId, selfId, targetId )
	if GetName(sceneId, targetId) == "��ٹ�ʯ�ҵ�"   then
		-- �����������ǲ�����Կ�ף�
		if  GetItemCount( sceneId, selfId, 40001001 ) > 0   then
			AddNumText(sceneId,x200008_g_ScriptId,"��ʯ��",6,888);
		end
		return
	end
	
  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200008_g_MissionId) > 0 then
		return
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200008_g_MissionId) > 0 then
		AddNumText(sceneId,x200008_g_ScriptId,x200008_g_MissionName,2,-1);
		--���������������
	elseif x200008_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200008_g_ScriptId,x200008_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200008_CheckAccept( sceneId, selfId )
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200008_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200008_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200008_g_MissionId, x200008_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺻�Х����",MSG2PLAYER_PARA )
	
	-- ������󣬰���صĹ�����Ϊ����ս��
	-- ��Ҫ�������еĹ֣��ı����ǵ���Ӫ
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "������"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
			SetNPCAIType(sceneId, nMonsterId, 1)
		end
	end
	
	-- ���������ϵ���¼�
	SetMissionEvent(sceneId, selfId, x200008_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200008_g_MissionId, 2)

end

--**********************************
--����
--**********************************
function x200008_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200008_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200008_g_SignPost.tip )
	DelItem( sceneId, selfId, 40001001, 1 )
end

--**********************************
--����
--**********************************
function x200008_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200008_g_MissionName)
		AddText(sceneId,x200008_g_MissionComplete)
		AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
		for i, item in x200008_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200008_CheckSubmit( sceneId, selfId )

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200008_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)
	
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)

	if Kill1~=1 			then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200008_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x200008_CheckSubmit(sceneId, selfId) ~= 1   then
		return
	end

	BeginAddItem(sceneId)
	for i, item in x200008_g_RadioItemBonus do
		if item.id == selectRadioId then
			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--���������
	if ret < 1 then
		--������û�мӳɹ�
		BeginEvent(sceneId)
			strText = "��������,�޷��������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	AddItemListToHuman(sceneId,selfId)

	AddMoney(sceneId,selfId,x200008_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200008_g_exp)

	DelMission( sceneId, selfId, x200008_g_MissionId )
	MissionCom( sceneId, selfId, x200008_g_MissionId )
	Msg2Player( sceneId, selfId,"#Y������񣺻�Х����",MSG2PLAYER_PARA )
	
	Msg2Player( sceneId, selfId,"���Ѿ������#G��ٹ�#Wϵ������",MSG2PLAYER_PARA )
	local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
	LuaFnSendMailToGUID(sceneId, selfGuid, "���Ѿ������#G��ٹ�#Wϵ���������ڴﵽ30��֮���ڴ�����ҵ�����ʦ������#G������#Wϵ������")
	
	-- �����ٹȾ��飬��10������
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
	
	-- ֪ͨ��ң�����������ѭ��������
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)

	-- ֪ͨ��ң�����������ѭ��������
	-- �����ڿ���ȥAA�ǵ�[bb��cc]�ҵ�DD������DDѭ������
	local strText1 = "#{LOOTMISSION_MAIL_01}#r#{LOOTMISSION_MAIL_02}#r#{LOOTMISSION_MAIL_03}#r#{LOOTMISSION_MAIL_04}"
	LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#{LOOTMISSION_INFO_01}");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--ɱ����������
--**********************************
function x200008_OnKillObject( sceneId, selfId, objdataId ,objId)

	if GetName(sceneId,objId) == "������"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200008_g_MissionId) > 0 then
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ�������죺1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
				AddMonsterDropItem(sceneId,objId,humanObjId,40001001)    --��������������(���߻������ʬ�����)
			end
		end
	end	
end

--**********************************
--���������¼�
--**********************************
function x200008_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200008_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == 40001001    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "�ѵõ�ʯ��Կ��:1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end
